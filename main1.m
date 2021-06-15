
close all
clear all
clc

for tr=17:17
    for g=1:30
 
        SearchAgents_no=30;

        aa=["F1" "F2" "F3" "F4" "F5" "F6" "F7" "F8" "F9" "F10" "F11" "F12" "F13" "F14" "F15" "F16" "F17" "F18" "F19" "F20" "F21" "F22" "F23"];
        Function_name=aa(tr);

        Max_iteration=500;
        [lb,ub,dim,fobj]=Get_Functions_details(Function_name);

        [Best_score1,Best_pos1,EHO_curve1]=EHO1(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        [Best_score2,Best_pos2,EHO_curve2]=SRGM(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        [Best_score3,Best_pos3,EHO_curve3]=GSO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        [Best_score4,Best_pos4,EHO_curve4]=EHO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        %  Different versions
        %         [Best_score1,Best_pos1,EHO_curve1]=EHO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        %         [Best_score2,Best_pos2,EHO_curve2]=EHO(SearchAgents_no,Max_iteration1,lb,ub,dim,fobj);
        %         [Best_score3,Best_pos3,EHO_curve3]=EHO(SearchAgents_no1,Max_iteration,lb,ub,dim,fobj);
        %         [Best_score4,Best_pos4,EHO_curve4]=EHO(SearchAgents_no1,Max_iteration1,lb,ub,dim,fobj);
        %         [Best_score5,Best_pos5,EHO_curve5]=EHO(SearchAgents_no2,Max_iteration,lb,ub,dim,fobj);
        %         [Best_score6,Best_pos6,EHO_curve6]=EHO(SearchAgents_no2,Max_iteration1,lb,ub,dim,fobj);
        %         [Best_score7,Best_pos7,EHO_curve7]=EHO3(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        %         [Best_score8,Best_pos8,EHO_curve8]=EHO3(SearchAgents_no,Max_iteration1,lb,ub,dim,fobj);
        %         [Best_score9,Best_pos9,EHO_curve9]=EHO3(SearchAgents_no1,Max_iteration,lb,ub,dim,fobj);
        %         [Best_score10,Best_pos10,EHO_curve10]=EHO3(SearchAgents_no1,Max_iteration1,lb,ub,dim,fobj);
        %         [Best_score11,Best_pos11,EHO_curve11]=EHO3(SearchAgents_no2,Max_iteration,lb,ub,dim,fobj);
        %         [Best_score12,Best_pos12,EHO_curve12]=EHO3(SearchAgents_no2,Max_iteration1,lb,ub,dim,fobj);
        % [Best_score1,Best_pos1,EHO_curve1]=EHO1(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        % [Best_score2,Best_pos2,WOA_cg_curve]=WOA(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        % [Best_pos3,Best_score3,EO_curve]=EO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        % [Best_score4,Best_pos4,HHO_curve]=HHO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        % [Best_score5,Best_pos5,CSO_curve]=CSO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        % [Best_pos6,Best_score6,GWO_curve]=GWO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        % [Best_score7,Best_pos7,SFO_curve]=SFO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        % [Best_score8,Best_pos8,EHO_curve2]=EHO2(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);
        
        %%  plot
        %         figure(1)
        %         h1=semilogy(EHO_curve1,'r');
        %         hold on
        %         title('F1')
        %         xlabel('Iteration');
        %         ylabel('Fitness');
        %         axis tight
        %         hold on
        %
        %         figure(1)
        %         h2=semilogy(EHO_curve2,'b');
        %         hold on
        %
        %         figure(1)
        %         h3=semilogy(EHO_curve3,'m');
        %         hold on
        %
        %         figure(1)
        %         h4=semilogy(EHO_curve4,'color',[0.2 0.2 0.1]);
        %         hold on
        %
        %
        %         v=round(linspace(1,500,20));
        %         for t=1:20
        %             figure(1)
        %             h5(t)=plot(v(t),EHO_curve1(v(t)),'r-o');
        %             h6(t)=plot(v(t),EHO_curve2(v(t)),'b-d');
        %             h7(t)=plot(v(t),EHO_curve3(v(t)),'m-<');
        %             h8(t)=plot(v(t),EHO_curve4(v(t)),'>','color',[0.8 0.2 0.5]);
        %             hold on
        %         end
        %          hl=legend([h5(1) h6(1) h7(1) h8(2)], 'EHO','SR-GM','GSO','SRGS-EHO');
        %          set(hl,'Orientation','horizon')
        %          set(hl,'Box','off');
        %         ZZ=[EHO_curve1; EHO_curve2; EHO_curve3 ;EHO_curve4];
        %         ZZ=ZZ';
        %%
        z(g,1)=Best_pos1;
        z(g,2)=Best_pos2;
        z(g,3)=Best_pos3;
        z(g,4)=Best_pos4;
        zz(g,:)=z(g,:)-0.398;
        zzz(g,:)=abs(zz(g,:));
        [a1,a2]=sort(zzz(g,:));
        for ggg=1:4
            v1(g,ggg)=find(ggg==a2);
        end
    end
    for p=1:4
        vv(p)=mean(v1(:,p));
    end
end
%%
%
% figure(1)
% plot(HHO_curve,'k')
% hold on
%
% figure(1)
% plot(CSO_curve,'m')
% hold on
%
% figure(1)
% plot(GWO_curve,'c')
% hold on
%
% figure(1)
% plot(SFO_curve,'color',[0 0.5 0.5])
% hold on
%
% figure(1)
% plot(EHO_curve2,'color',[0.5 0 0.1])
% hold on
% legend('SRGS-EHO','EHO','WOA','EO','HHO','CSO','GWO','SFO','IEHO')
%
% z(g,1)=Best_pos;
% z(g,2)=Best_pos1;
% z(g,3)=Best_score2;
% z(g,4)=Best_score3;
% z(g,5)=Best_score4;
% z(g,6)=Best_pos5;
% z(g,7)=Best_pos6;
% z(g,8)=Best_pos7;
% z(g,9)=Best_pos8;

%         z(g,1)=Best_pos1;
%         z(g,2)=Best_pos2;
%         z(g,3)=Best_pos3;
%         z(g,4)=Best_pos4;
%         z(g,5)=Best_pos5;
%         z(g,6)=Best_pos6;
%         z(g,7)=Best_pos7;
%         z(g,8)=Best_pos8;
%          z(g,9)=Best_pos9;
%         z(g,10)=Best_pos10;
%         z(g,11)=Best_pos11;
%         z(g,12)=Best_pos12;
%

% for n=1:9
% h(f,n)=mean(z(:,n));
% h(f+1,n)=std(z(:,n));
% p(tr,n)=ranksum(z(:,n),z(:,1),0.05);
%
%     for dxx=1:12
%         h(tr,dxx)=mean(z(:,dxx));
%     end
%          f=2*tr-1;
%     for dx=1:12
%         h(f,dx)=mean(z(:,dx));
%         h(f+1,dx)=std(z(:,dx));
%     end

% b(8)=-418.9829*30;
% b(14:23)=[1 0.00030 -1.0316 0.398 3 -3.86 -3.32 -10.1532 -10.4028 -10.5363];
% b=b';
% bb=b(1:tr);

% for fd=1:12
%     c(:,fd)=z(:,fd)-bb;
% end

% c=z-b(tr);
% cc=abs(c);
% for gg=1:g
%     [a1,a2]=sort(cc(gg,:));
%
% for ggg=1:12
%     v(gg,ggg)=find(ggg==a2);
% end
% for p=1:12
% vv(p)=mean(v(:,p));
% end
%
% end
%  end
% vvv(tr,:)=vv;
%     end