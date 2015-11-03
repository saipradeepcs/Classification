% a=[1 2 3; 3 4 5; 6 7 8];
% b=[1 0 0; 0 1 0; 0 0 1];
% c=a+b;
% d=num2cell(c);

% a=importdata('D:\ACADS\IDA\Assignment_2\magic04.xlsx');
%%%Solution 1%%%%
data = xlsread('D:\ACADS\IDA\Assignment_2\magic04.xlsx');
% [Training_data,validation_data,test_data]=dividerand(19020,0.684,0.1577,0.1577);
% 
% size(Training_data);
% size(validation_data);
% size(test_data);

x=randperm(19020);
Training_data=data(x(1:13020),:);
validation_data = data(x(13021:16020),:);
test_data = data(x(16021:end),:);
%%%%Solution 2%%%%
Features = Training_data(:,1:10);
ClassLabels = Training_data(:,11);

%%%%%%%Solution 3%%%%%%%
first_dtr = fitctree(Features,ClassLabels,'MinLeafSize',1200);
view(first_dtr,'Mode','graph');
num_nodes = first_dtr.NumNodes;

%%%%%%%Solution 4%%%%%%
TestFeatures = test_data(:,1:10);
PredictLabels = predict(first_dtr,TestFeatures);
original_labels = test_data(:,11);
group = original_labels;
grouphat = PredictLabels;
order = [1,0];
[c,order] = confusionmat(grouphat,group,'order',order);
count=0;
for i=1:3000
    if(grouphat(i) == 1 && group(i) == 0)
    count = count+1;
    end
end
e=c(1,1);
f=c(1,2);
g=c(2,1);
h=c(2,2);
accuracy_1200 = (e+f)/(e+f+g+h);
precision = e/(e+f);
recall = e/(e+g);
fprintf('Accuracy is %f\n Precision is %f \n Recall is %f ',accuracy_1200,precision,recall);
%%%%%%%%%%%%%5 Solution%%%%%%%%%%%

training_data_dtr = fitctree(Features,ClassLabels,'MinLeafSize',1000);
view(training_data_dtr,'Mode','graph');
num_nodes_training_data_dtr_1000 = training_data_dtr.NumNodes;
Predicted_labels1000 = predict(training_data_dtr,Features);
order = [1,0];
[d,order] = confusionmat(Predicted_labels1000,ClassLabels,'order',order);
p=d(1,1);
q=d(1,2);
r=d(2,1);
s=d(2,2);
accuracy_1000 = (p+s)/(p+q+r+s);
precision_1000 = p/(p+q);
recall_1000 = p/(p+r);
fprintf('Accuracy is %f\n Precision is %f \n Recall is %f ',accuracy_1000,precision_1000,recall_1000);
tp_count=0;
tn_count=0;
fp_count=0;
fn_count=0;
for i=1:13020
    if(Predicted_labels1000(i) == 1 && ClassLabels(i) == 1)
    tp_count = tp_count+1;
%     d.True_Positive_Count = tp_count; 
    elseif(Predicted_labels1000(i) == 1 && ClassLabels(i) == 0)
    fp_count=fp_count+1;
%     d.False_Positive_Count = fp_Count;
    elseif(Predicted_labels1000(i) == 0 && ClassLabels(i) == 1)
        fn_count=fn_count+1;
%         d.False_Negative_Count = fn_Count;
    elseif(Predicted_labels1000(i) == 0 && ClassLabels(i) == 0)
        tn_count=tn_count+1;
%         d.True_Negative_Count = tn_Count;
    
    end
end
%%%%%%%%%5 c bit%%%%%

Validation_data_Features = validation_data(:,1:10);
validation_data_labels = validation_data(:,11);
Predicted_labels_validation_data = predict(training_data_dtr,Validation_data_Features);
order = [1,0];
[vd,order] = confusionmat(Predicted_labels_validation_data,validation_data_labels,'order',order);
p0=vd(1,1);
q0=vd(1,2);
r0=vd(2,1);
s0=vd(2,2);
accuracy_vd_1000 = (p0+s0)/(p0+q0+r0+s0);
precision_vd_1000 = p0/(p0+q0);
recall_vd_1000 = p0/(p0+r0);
fprintf('Accuracy is %f\n Precision is %f \n Recall is %f ',accuracy_vd_1000,precision_vd_1000,recall_vd_1000);
%%%%%%%%%%6 question for 20 records%%%%%%%%

training_data_dtr_20 = fitctree(Features,ClassLabels,'MinLeafSize',20);
view(training_data_dtr_20,'Mode','graph');
Predicted_labels_20 = predict(training_data_dtr_20,Features);
order = [1,0];
[mat_for_20_records,order] = confusionmat(Predicted_labels_20,ClassLabels,'order',order);
p00=mat_for_20_records(1,1);
q00=mat_for_20_records(1,2);
r00=mat_for_20_records(2,1);
s00=mat_for_20_records(2,2);
accuracy_mat_for_20_records = (p00+s00)/(p00+q00+r00+s00);
precision_mat_for_20_records = p00/(p00+q00);
recall_mat_for_20_records = p00/(p00+r00);
fprintf('Accuracy is %f\n Precision is %f \n Recall is %f ',accuracy_mat_for_20_records,precision_mat_for_20_records,recall_mat_for_20_records);
%%%%%%%%%6 - 5 c bit repeat for 20 records%%%%%

Validation_data_Features = validation_data(:,1:10);
Predicted_labels_validation_data_20 = predict(training_data_dtr_20,Validation_data_Features);
order = [1,0];
[vd_20,order] = confusionmat(Predicted_labels_validation_data_20,validation_data_labels,'order',order);
p01=vd_20(1,1);
q01=vd_20(1,2);
r01=vd_20(2,1);
s01=vd_20(2,2);
accuracy01 = (p01+s01)/(p01+q01+r01+s01);
precision01 = p01/(p01+q01);
recall01 = p01/(p01+r01);
fprintf('Accuracy is %f\n Precision is %f \n Recall is %f ',accuracy01,precision01,recall01);
%%%%%%%%%%%%7 Question%%%%%%%%%%%%%%
%%%%%%%%%750 nodes training data%%%%%%%
training_data_dtr_750_nodes = fitctree(Features,ClassLabels,'MinLeafSize',750);
num_nodes_train_750 = training_data_dtr_750_nodes.NumNodes;
% view(training_data_dtr_750_nodes,'Mode','graph');
Predicted_labels_750_nodes = predict(training_data_dtr_750_nodes,Features);
order = [1,0];
[mat_750,order] = confusionmat(Predicted_labels_750_nodes,ClassLabels,'order',order);
p1=mat_750(1,1);
q1=mat_750(1,2);
r1=mat_750(2,1);
s1=mat_750(2,2);
accuracy_train_750 = (p1+s1)/(p1+q1+r1+s1);
%%%%%%%%%%750 nodes validation data%%%%%%
Predicted_labels_validation_data_750_nodes = predict(training_data_dtr_750_nodes,Validation_data_Features);
order = [1,0];
[vd_750,order] = confusionmat(Predicted_labels_validation_data_750_nodes,validation_data_labels,'order',order);
p11=vd_750(1,1);
q11=vd_750(1,2);
r11=vd_750(2,1);
s11=vd_750(2,2);
accuracy_vald_750 = (p11+s11)/(p11+q11+r11+s11);
%%%%%%%%%500 nodes training data%%%%%%%
training_data_dtr_500_nodes = fitctree(Features,ClassLabels,'MinLeafSize',500);
% view(training_data_dtr_500_nodes,'Mode','graph');
num_nodes_train_500 = training_data_dtr_500_nodes.NumNodes;
Predicted_labels_500_nodes = predict(training_data_dtr_500_nodes,Features);
order = [1,0];
[mat_500,order] = confusionmat(Predicted_labels_500_nodes,ClassLabels,'order',order);
p2=mat_500(1,1);
q2=mat_500(1,2);
r2=mat_500(2,1);
s2=mat_500(2,2);
accuracy_train_500 = (p2+s2)/(p2+q2+r2+s2);
%%%%%%%%%%500 nodes validation data%%%%%%
Predicted_labels_validation_data_500_nodes = predict(training_data_dtr_500_nodes,Validation_data_Features);
order = [1,0];
[vd_500,order] = confusionmat(Predicted_labels_validation_data_500_nodes,validation_data_labels,'order',order);
p22=vd_500(1,1);
q22=vd_500(1,2);
r22=vd_500(2,1);
s22=vd_500(2,2);
accuracy_vald_500 = (p22+s22)/(p22+q22+r22+s22);

%%%%%%%%%250 nodes training data%%%%%%%
training_data_dtr_250_nodes = fitctree(Features,ClassLabels,'MinLeafSize',250);
% view(training_data_dtr_250_nodes,'Mode','graph');
num_nodes_train_250 = training_data_dtr_250_nodes.NumNodes;
Predicted_labels_250_nodes = predict(training_data_dtr_250_nodes,Features);
order = [1,0];
[mat_250,order] = confusionmat(Predicted_labels_250_nodes,ClassLabels,'order',order);
p3=mat_250(1,1);
q3=mat_250(1,2);
r3=mat_250(2,1);
s3=mat_250(2,2);
accuracy_train_250 = (p3+s3)/(p3+q3+r3+s3);

%%%%%%%%%%250 nodes validation data%%%%%%
Predicted_labels_validation_data_250_nodes = predict(training_data_dtr_250_nodes,Validation_data_Features);
order = [1,0];
[vd_250,order] = confusionmat(Predicted_labels_validation_data_250_nodes,validation_data_labels,'order',order);
p33=vd_250(1,1);
q33=vd_250(1,2);
r33=vd_250(2,1);
s33=vd_250(2,2);
accuracy_vald_250 = (p33+s33)/(p33+q33+r33+s33);

%%%%%%%%%125 nodes training data%%%%%%%
training_data_dtr_125_nodes = fitctree(Features,ClassLabels,'MinLeafSize',125);
% view(training_data_dtr_125_nodes,'Mode','graph');
num_nodes_train_125 = training_data_dtr_125_nodes.NumNodes;
Predicted_labels_125_nodes = predict(training_data_dtr_125_nodes,Features);
order = [1,0];
[mat_125,order] = confusionmat(Predicted_labels_125_nodes,ClassLabels,'order',order);
p4=mat_125(1,1);
q4=mat_125(1,2);
r4=mat_125(2,1);
s4=mat_125(2,2);
accuracy_train_125 = (p4+s4)/(p4+q4+r4+s4);

%%%%%%%%%%125 nodes validation data%%%%%%
Predicted_labels_validation_data_125_nodes = predict(training_data_dtr_125_nodes,Validation_data_Features);
order = [1,0];
[vd_125,order] = confusionmat(Predicted_labels_validation_data_125_nodes,validation_data_labels,'order',order);
p44=vd_125(1,1);
q44=vd_125(1,2);
r44=vd_125(2,1);
s44=vd_125(2,2);
accuracy_vald_125 = (p44+s44)/(p44+q44+r44+s44);

%%%%%%%%%100 nodes training data%%%%%%%
training_data_dtr_100_nodes = fitctree(Features,ClassLabels,'MinLeafSize',100);
% view(training_data_dtr_100_nodes,'Mode','graph');
num_nodes_train_100 = training_data_dtr_100_nodes.NumNodes;
Predicted_labels_100_nodes = predict(training_data_dtr_100_nodes,Features);
order = [1,0];
[mat_100,order] = confusionmat(Predicted_labels_100_nodes,ClassLabels,'order',order);
p5=mat_100(1,1);
q5=mat_100(1,2);
r5=mat_100(2,1);
s5=mat_100(2,2);
accuracy_train_100 = (p5+s5)/(p5+q5+r5+s5);

%%%%%%%%%%100 nodes validation data%%%%%%
Predicted_labels_validation_data_100_nodes = predict(training_data_dtr_100_nodes,Validation_data_Features);
order = [1,0];
[vd_100,order] = confusionmat(Predicted_labels_validation_data_100_nodes,validation_data_labels,'order',order);
p55=vd_100(1,1);
q55=vd_100(1,2);
r55=vd_100(2,1);
s55=vd_100(2,2);
accuracy_vald_100 = (p55+s55)/(p55+q55+r55+s55);

%%%%%%%%%50 nodes training data%%%%%%%
training_data_dtr_50_nodes = fitctree(Features,ClassLabels,'MinLeafSize',50);
% view(training_data_dtr_50_nodes,'Mode','graph');
num_nodes_train_50 = training_data_dtr_50_nodes.NumNodes;
Predicted_labels_50_nodes = predict(training_data_dtr_50_nodes,Features);
order = [1,0];
[mat_50,order] = confusionmat(Predicted_labels_50_nodes,ClassLabels,'order',order);
p6=mat_50(1,1);
q6=mat_50(1,2);
r6=mat_50(2,1);
s6=mat_50(2,2);
accuracy_train_50 = (p6+s6)/(p6+q6+r6+s6);

%%%%%%%%%%50 nodes validation data%%%%%%
Predicted_labels_validation_data_50_nodes = predict(training_data_dtr_50_nodes,Validation_data_Features);
order = [1,0];
[vd_50,order] = confusionmat(Predicted_labels_validation_data_50_nodes,validation_data_labels,'order',order);
p66=vd_50(1,1);
q66=vd_50(1,2);
r66=vd_50(2,1);
s66=vd_50(2,2);
accuracy_vald_50 = (p66+s66)/(p66+q66+r66+s66);
%%%%%%%%%20 nodes training data%%%%%%%
training_data_dtr_20_nodes = fitctree(Features,ClassLabels,'MinLeafSize',20);
% view(training_data_dtr_20_nodes,'Mode','graph');
num_nodes_train_20 = training_data_dtr_20_nodes.NumNodes;
Predicted_labels_20_nodes = predict(training_data_dtr_20_nodes,Features);
order = [1,0];
[mat_20,order] = confusionmat(Predicted_labels_20_nodes,ClassLabels,'order',order);
p7=mat_20(1,1);
q7=mat_20(1,2);
r7=mat_20(2,1);
s7=mat_20(2,2);
accuracy_train_20 = (p7+s7)/(p7+q7+r7+s7);
%%%%%%%%%%20 nodes validation data%%%%%%
Predicted_labels_validation_data_20_nodes = predict(training_data_dtr_20_nodes,Validation_data_Features);
order = [1,0];
[vd_20,order] = confusionmat(Predicted_labels_validation_data_20_nodes,validation_data_labels,'order',order);
p77=vd_20(1,1);
q77=vd_20(1,2);
r77=vd_20(2,1);
s77=vd_20(2,2);
accuracy_vald_20 = (p77+s77)/(p77+q77+r77+s77);
%%%%%%%%%10 nodes training data%%%%%%%
training_data_dtr_10_nodes = fitctree(Features,ClassLabels,'MinLeafSize',10);
% view(training_data_dtr_10_nodes,'Mode','graph');
num_nodes_train_10 = training_data_dtr_10_nodes.NumNodes;
Predicted_labels_10_nodes = predict(training_data_dtr_10_nodes,Features);
order = [1,0];
[mat_10,order] = confusionmat(Predicted_labels_10_nodes,ClassLabels,'order',order);
p8=mat_10(1,1);
q8=mat_10(1,2);
r8=mat_10(2,1);
s8=mat_10(2,2);
accuracy_train_10 = (p8+s8)/(p8+q8+r8+s8);

%%%%%%%%%%10 nodes validation data%%%%%%
Predicted_labels_validation_data_10_nodes = predict(training_data_dtr_10_nodes,Validation_data_Features);
order = [1,0];
[vd_10,order] = confusionmat(Predicted_labels_validation_data_10_nodes,validation_data_labels,'order',order);
p88=vd_10(1,1);
q88=vd_10(1,2);
r88=vd_10(2,1);
s88=vd_10(2,2);
accuracy_vald_10 = (p88+s88)/(p88+q88+r88+s88);

%%%%%%%%%5 nodes training data%%%%%%%
training_data_dtr_5_nodes = fitctree(Features,ClassLabels,'MinLeafSize',5);
% view(training_data_dtr_5_nodes,'Mode','graph');
num_nodes_train_5 = training_data_dtr_5_nodes.NumNodes;
Predicted_labels_5_nodes = predict(training_data_dtr_5_nodes,Features);
order = [1,0];
[mat_5,order] = confusionmat(Predicted_labels_5_nodes,ClassLabels,'order',order);
p9=mat_5(1,1);
q9=mat_5(1,2);
r9=mat_5(2,1);
s9=mat_5(2,2);
accuracy_train_5 = (p9+s9)/(p9+q9+r9+s9);

%%%%%%%%%%5 nodes validation data%%%%%%
Predicted_labels_validation_data_5_nodes = predict(training_data_dtr_5_nodes,Validation_data_Features);
order = [1,0];
[vd_5,order] = confusionmat(Predicted_labels_validation_data_5_nodes,validation_data_labels,'order',order);
p99=vd_5(1,1);
q99=vd_5(1,2);
r99=vd_5(2,1);
s99=vd_5(2,2);
accuracy_vald_5 = (p99+s99)/(p99+q99+r99+s99);

%%%%%%%%%Total Accuracy and Nodes%%%%%%%%%%
% Total_accuracy_train = [accuracy_1000,accuracy_train_750,accuracy_train_500,accuracy_train_250,accuracy_train_125,accuracy_train_100,accuracy_train_50,accuracy_train_20,accuracy_train_10,accuracy_train_5];
% Total_accuracy_validation = [accuracy_vd_1000,accuracy_vald_750,accuracy_vald_500,accuracy_vald_250,accuracy_vald_125,accuracy_vald_100,accuracy_vald_50,accuracy_vald_20,accuracy_vald_10,accuracy_vald_5];
% Total_noof_nodes = [num_nodes_training_data_dtr_1000,num_nodes_train_750,num_nodes_train_500,num_nodes_train_250,num_nodes_train_125,num_nodes_train_100,num_nodes_train_50,num_nodes_train_20,num_nodes_train_10,num_nodes_train_5];
% %%%%%%%%%%%
Total_accuracy_train = [accuracy_train_5,accuracy_train_10,accuracy_train_20,accuracy_train_50,accuracy_train_100,accuracy_train_125,accuracy_train_250,accuracy_train_500,accuracy_train_750,accuracy_1000];
Total_accuracy_validation = [accuracy_vald_5,accuracy_vald_10,accuracy_vald_20,accuracy_vald_50,accuracy_vald_100,accuracy_vald_125,accuracy_vald_250,accuracy_vald_500,accuracy_vald_750,accuracy_vd_1000];
Total_noof_nodes = [num_nodes_train_5,num_nodes_train_10,num_nodes_train_20,num_nodes_train_50,num_nodes_train_100,num_nodes_train_125,num_nodes_train_250,num_nodes_train_500,num_nodes_train_750,num_nodes_training_data_dtr_1000];

figure();
hold all
plot(Total_noof_nodes,Total_accuracy_train,Total_noof_nodes,Total_accuracy_validation)
%  plot(Total_noof_nodes,Total_accuracy_train)
%  plot(Total_noof_nodes,Total_accuracy_validation)
legend('training','validation');

%%%%%%%%%%8 Question%%%%%%%%
Records_Per_Leaf_nodes = [5,10,20,50,100,125,250,500,750,1000];
figure()
hold all
%Finding the number of records
plot(Records_Per_Leaf_nodes,Total_accuracy_validation)
legend('Leaf Nodes','Accuracy');

%Creatind decision tree for leaf node no less than 20 records
training_data_dtr_20_final_ques = fitctree(Features,ClassLabels,'MinLeafSize',20);
view(training_data_dtr_20_final_ques,'Mode','graph');
noofnodes = training_data_dtr_20_final_ques.NumNodes;
Predicted_labels_20_final_ques = predict(training_data_dtr_20,TestFeatures);
order = [1,0];
[mat_for_20_records_final_ques,order] = confusionmat(Predicted_labels_20_final_ques,original_labels,'order',order);
pf=mat_for_20_records_final_ques(1,1);
qf=mat_for_20_records_final_ques(1,2);
rf=mat_for_20_records_final_ques(2,1);
sf=mat_for_20_records_final_ques(2,2);
accuracy_mat_for_20_records_final_ques = (pf+sf)/(pf+qf+rf+sf);
precision_mat_for_20_records_final_ques = pf/(pf+qf);
recall_mat_for_20_records_final_ques = pf/(pf+rf);
fprintf('Accuracy for best decision tree is %f\n Precision for best decision tree is %f \n Recall for best decision tree is %f ',accuracy_mat_for_20_records_final_ques...
    ,precision_mat_for_20_records_final_ques,recall_mat_for_20_records_final_ques);