%%%Question 1%%%
raw_data = xlsread('D:\ACADS\IDA\Assignment_3\Raw Data.xlsx');
data = knnimpute(raw_data);

%%%%%Question 2%%%%%
x=randperm(699);
Training_data = data(x(1:500),:);
Test_data = data(x(501:end),:);
attr={'Clump Thickness','Uniformity of Cell Size','Uniformity of Cell Shape','Marginal Adhesion'...
    'Single Epithelial Cell Size','Bare Nuclei','Bland Chromatin','Normal Nucleoli','Mitoses'};
%%%%%Question 3%%%%%
Features = Training_data(:,2:10);
ClassLabels = Training_data(:,11);
Training_dtr = fitctree(Features, ClassLabels, 'PredictorNames',attr,'MinLeafSize',25);
view(Training_dtr,'Mode','graph');


%%%%%%Question 4%%%%%%%%
Test_Features = Test_data(:,2:10);
Test_OriginalLabels = Test_data(:,11);
PredictedLabels = predict(Training_dtr,Test_Features);
group = Test_OriginalLabels;
grouphat = PredictedLabels;
order = [2,4];
[c ,order]= confusionmat(grouphat,group,'order',order);

e=c(1,1);
f=c(1,2);
g=c(2,1);
h=c(2,2);

precision = e/(e+f);
recall = e/(e+g);
f1_score = 2*((precision*recall)/(precision+recall));

fprintf('\n Precision for decision tree is %f \n Recall for decision tree is %f \n F1 Score for decision tree is %f',precision,recall,f1_score);
%%%%Question 5%%%%%
SVMmodel = fitcsvm(Features, ClassLabels,'Standardize',true,'KernelFunction','RBF',...    
'KernelScale','auto');
PredictedLabels_Test_data = predict(SVMmodel,Test_Features);
order = [2,4];
[Test_199,order] = confusionmat(PredictedLabels_Test_data,Test_OriginalLabels,'order',order);
%view(SVMmodel,'Mode','graph');
p=Test_199(1,1);
q=Test_199(1,2);
r=Test_199(2,1);
s=Test_199(2,2);
accuracy_Test_199 = (p+s)/(p+q+r+s);
precision_Test_199 = p/(p+q);
recall_Test_199 = p/(p+r);
f1_score_Test_199 = 2*((precision_Test_199*recall_Test_199)/(precision_Test_199+recall_Test_199));
fprintf('\n Precision for SVM is %f \n Recall for SVM is %f \n F1 Score for SVM is %f',precision_Test_199,...
    recall_Test_199,f1_score_Test_199);
%%%%Question 7%%%%

misclassification_rate_decision_tree = (f*10)+(g*30);
misclassification_rate_SVM = (q*10)+(r*30);

disp('misclassification_rate for decision tree is')
disp(misclassification_rate_decision_tree)
disp('misclassification_rate for SVM is')
disp(misclassification_rate_SVM)
%%%Question 8%%%%%%

for i= 1:199
    if(~(Test_OriginalLabels(i) == PredictedLabels(i)))
        %misclassified_record(i) = Test_set(i);
        l=i;
        disp('Test_OriginalLabel is')
        disp(Test_OriginalLabels(i))
        disp('Misclassified as')
        disp(PredictedLabels(i))
        break;
    end
end
disp('Misclassified row index is')
disp(l)
y = Training_data(:,2:10);

z = (Test_data(l,2:10));
[n3,d3]=knnsearch(y,z,'k',3,'distance','euclidean');
disp('Three nearest neighbors with their Sample Code numbers are')
disp(Training_data(n3,[1,11]));
disp('Mode of the class labels is')
disp(mode(Training_data(n3,11)))
disp('Class label assigned with three nearest neighbors is')
if(mode(Training_data(n3,11)== 2))
    disp('Benign')
elseif(mode(Training_data(n3,11)== 4))
    disp('Malignant')
end

[n1,d1]=knnsearch(y,z,'k',1,'distance','euclidean');
disp('One nearest neighbors with their Sample Code number is')
disp(Training_data(n1,[1,11]));
disp('Class label assigned with one nearest neighbors is')
if(mode(Training_data(n1,11)== 2))
    disp('Benign')
elseif(mode(Training_data(n1,11)== 4))
    disp('Malignant')
end

[n5,d5]=knnsearch(y,z,'k',5,'distance','euclidean');
disp('Five nearest neighbors with their Sample Code numbers are')
disp(Training_data(n5,[1,11]));
disp('Mode of the class labels is')
disp(mode(Training_data(n5,11)))
disp('Class label assigned with five nearest neighbors is')
if(mode(Training_data(n5,11)== 2))
    disp('Benign')
elseif(mode(Training_data(n5,11)== 4))
    disp('Malignant')
end
[n7,d7]=knnsearch(y,z,'k',7,'distance','euclidean');

disp('Seven nearest neighbors with their Sample Code numbers are')
disp(Training_data(n7,[1,11]));
disp('Seven nearest neighbors with their Sample Code numbers are')
disp(Training_data(n7,[1,11]));
disp('Mode of the class labels is')
disp(mode(Training_data(n7,11)))
disp('Class label assigned with Seven nearest neighbors is')
if(mode(Training_data(n7,11)== 2))
    disp('Benign')
elseif(mode(Training_data(n7,11)== 4))
    disp('Malignant')
end



