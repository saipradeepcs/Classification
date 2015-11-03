% %%%%1st Program%%%%%%%%%
% %%data = xlsread('');
% %data(:,5) = data(:,2) + data(:,3);
% % b = max(ds1.result);
% % a = min(ds.result);
% % n = 5;
% % width = round((b-a)/n,0);
% %bin1 = a+width;
% %bin2 = a+2*width;
% %bin3= a+3*width;
% %bin4 = a+4*width;
% %bin5= a+5*width;
% 
% cd('D:\Assignments UC sem1\IDA\Assingment 1')
% ds = dataset('XLSFile', 'DataHW1A.xlsx');
% f1 = ds.Phys;
% f2 = ds.Maths;
% result = f1+f2;
% ds.result = f1+f2;
% 
% 
% 
% for i = 1:40
%     if ((ds.result(i) >= 17) && (ds.result(i) < 52))
%     ds.equal_width_grade(i) = 'F';
%     elseif ((ds.result(i) >= 52) && (ds.result(i) < 87))
%             ds.equal_width_grade(i) = 'D';
%          
%     elseif ((ds.result(i) >= 87) && (ds.result(i) < 122))
%             ds.equal_width_grade(i) = 'C';
%          
%     elseif ((ds.result(i) >= 122) && (ds.result(i) < 157))
%             ds.equal_width_grade(i) = 'B';
%          
%     elseif ((ds.result(i) >= 157) && (ds.result(i) < 192))
%             ds.equal_width_grade(i) = 'A';
%          
%     end
% end
% 
% count =0;
% %%%%%%%%%%2nd Program%%%%%%%%%%%%%
% ds1 = sortrows(ds,5);
% 
% a=0;
% b=0;
% c=0;
% d=0;
% f=0;
% 
% for i = 1:40
%     if(i>1)
%         if(ds1.result(i)==ds1.result(i-1))
%             ds1.equal_freq_grade(i)=ds1.equal_freq_grade(i-1);
%             i=i+1;
%         end;
%     end;
%     if((i <= 8) )
%         ds1.equal_freq_grade(i)='F';   
%      elseif( (i>8 && i<=16))
%             ds1.equal_freq_grade(i)='D';
%      elseif ( (i>16 && i<=24))
%            ds1.equal_freq_grade(i)='C';
%      elseif( (i>24 && i<=32))
%           ds1.equal_freq_grade(i)='B';
%      elseif ( i>32 && i<=40)
%            ds1.equal_freq_grade(i)='A';
%      end
% 
% end
% 
% ds=sortrows(ds,5);
% Fcount=0;
% Dcount=0;
% Ccount=0;
% Bcount=0;
% Acount=0;
% for i =1:40
%     if(ds1.equal_width_grade(i)=='F')
%         Fcount = Fcount+1;
%     elseif(ds1.equal_width_grade(i)=='D')
%         Dcount = Dcount+1;
%     elseif(ds1.equal_width_grade(i)=='C')
%         Ccount = Ccount+1;
%     elseif(ds1.equal_width_grade(i)=='B')
%         Bcount = Bcount+1;
%     elseif(ds1.equal_width_grade(i)=='A')
%         Acount = Acount+1;
%     end
%     
% end 
% 
% Grades=['A','B','C','D','F'];
% 
% for i = 1:5
%     if (Grades(i)=='A')
%         ds1.Grades(i)='A';
%         ds1.eq_width_Grade_count(i)=Acount;
%     elseif (Grades(i)=='B')
%           ds1.Grades(i)='B';
%         ds1.eq_width_Grade_count(i)=Bcount;  
%     elseif (Grades(i)=='C')
%           ds1.Grades(i)='C';
%         ds1.eq_width_Grade_count(i)=Ccount; 
%      elseif (Grades(i)=='D')
%           ds1.Grades(i)='D';
%         ds1.eq_width_Grade_count(i)=Dcount;    
%       elseif (Grades(i)=='F')
%           ds1.Grades(i)='F';
%         ds1.eq_width_Grade_count(i)=Fcount;       
%     end
% end 
% 
% 
% 
% 
%         for i = 1:40
%                 if(ds1.equal_width_grade(i) < ds1.equal_freq_grade(i))
%                    ds1.Binning_happy(i) = 'Y';
%                 elseif(ds1.equal_width_grade(i)> ds1.equal_freq_grade(i))
%                    ds1.Binning_happy(i) = 'N';
%                 elseif(ds1.equal_width_grade(i) == ds1.equal_freq_grade(i))
%                    ds1.Binning_happy(i) = 'S';
%                 end
%         end 
%         
%         %%%%% PRINTING THE LIST OF STUDENTS HAPPIER WITH EQUAL WIDTH AND
%         %%%%% EQUAL FREQUENCY BINNING %%%%
%         
%          
%         
%         for i = 1:40
%           if (ds1.Binning_happy(i)=='Y')
%                 fprintf('student with id %d is happy with equal width binning \n',ds1.StudentId(i));
%             elseif(ds1.Binning_happy(i)=='N')
%                 fprintf(' student with id %d is happy with equal freq partition \n',ds1.StudentId(i));
%           end 
%         end
%         
%         %%%%%%3rd program compare grades %%%%%%%
%     %%% list of student ids whose grades changed %%%%
%     
%     for i=1:40
%        if (ds1.Binning_happy(i)=='Y' || ds1.Binning_happy(i)=='N')
%          fprintf('grades of student id %d changed \n',ds1.StudentId(i));   
%        end
%     end
%     
%     %%%%% 4th problem %%%%%
% %%%% creating z scores for physics and maths 
% 
% ds1.Phys_zscore = zscore(ds1.Phys);
% ds1.Maths_zscore = zscore(ds1.Maths);
% ds1.Sum_of_zscores = ds1.Phys_zscore+ds1.Maths_zscore;
% ds1=sortrows(ds1,13);
% %%%%%%%%Question 5
% for i=1:40
% if((i <= 8) )
%         ds1.equal_freq_grade_Zscore(i)='F';   
%      elseif( (i>8 && i<=16))
%             ds1.equal_freq_grade_Zscore(i)='D';
%      elseif ( (i>16 && i<=24))
%            ds1.equal_freq_grade_Zscore(i)='C';
%      elseif( (i>24 && i<=32))
%           ds1.equal_freq_grade_Zscore(i)='B';
%      elseif ( i>32 && i<=40)
%            ds1.equal_freq_grade_Zscore(i)='A';
% end
% 
% end
% 
%  for i = 1:40
%                 if(ds1.equal_freq_grade_Zscore(i) < ds1.equal_freq_grade(i))
%                 ds1.Binning_happy_4_vs_2(i) = 'Y';
%                 elseif(ds1.equal_freq_grade_Zscore(i)> ds1.equal_freq_grade(i))
%                   ds1.Binning_happy_4_vs_2(i) = 'N';
%                 elseif(ds1.equal_freq_grade_Zscore(i) == ds1.equal_freq_grade(i))
%                     ds1.Binning_happy_4_vs_2(i) = 'S';
%                 end
% end 
%         for i = 1:40
%           if (ds1.Binning_happy_4_vs_2(i)=='Y')
%                 fprintf('student with id %d is happy with equal Z score equal frequency binning \n',ds1.StudentId(i));
%             elseif(ds1.Binning_happy_4_vs_2(i)=='N')
%                 fprintf('student with id %d is happy with equal frequency binning \n',ds1.StudentId(i));
%           end 
%         end
%   %%%%%%%%%%%%%%7 Question%%%%%%%%%%%%%%
%   x = -0.3;
%   y = 0.3;
%   
%   for i=1:40
%       if(ds1.Phys_zscore(i) < x)
%           ds1.Phys_zscore_label(i) = 'L';
%       elseif(ds1.Phys_zscore(i) > x && ds1.Phys_zscore(i) < y)
%           ds1.Phys_zscore_label(i) = 'M';
%       elseif(ds1.Phys_zscore(i) > y)
%           ds1.Phys_zscore_label(i) = 'H';
%       end
%   end 
%   
%   for i = 1:40
%       if(ds1.Maths_zscore(i) < x)
%           ds1.Maths_zscore_label(i) = 'L';
%       elseif(ds1.Maths_zscore(i) > x && ds1.Phys_zscore(i) < y)
%           ds1.Maths_zscore_label(i) = 'M';
%       elseif(ds1.Maths_zscore(i) > y)
%           ds1.Maths_zscore_label(i) = 'H';
%       end
%   end
%   
%   %%%%%8th Question%%%%
%   
%   phy_Lcount=0;
%   phy_Mcount=0;
%   phy_Hcount=0;
%   math_Lcount=0;
%   math_Mcount=0;
%   math_Hcount=0;
% %   for i = 1:40
% %   if(ds1.Phys_zscore_label(i)=='L')
% %       phy_Lcount=phy_Lcount+1;
% %   elseif(ds1.Phys_zscore_label(i)=='M')
% %       phy_Mcount=phy_Mcount+1;
% %   elseif(ds1.Phys_zscore_label(i)=='H')
% %       phy_Hcount=phy_Hcount+1;
% %   end
% %   end
%   for k=1:40
%   if(ds1.Maths_zscore_label(k) == 'H')
%       math_Hcount=math_Hcount+1;
%   elseif(ds1.Maths_zscore_label(k) == 'M')
%       math_Mcount=math_Mcount+1;
%   elseif(ds1.Maths_zscore_label(k) == 'L')
%       math_Lcount=math_Lcount+1;
%   end
%   
%  end
% % clear math_Lcount math_Mcount math_Hcount phy_Hcount phy_Lcount phy_Mcount hcount;