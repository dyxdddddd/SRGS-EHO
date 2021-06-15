function Positions=initializationNew(SearchAgents_no,dim,ub,lb,fun)

Boundary_no= size(ub,2);
BackPositions = zeros(SearchAgents_no,dim);
ci=zeros(SearchAgents_no,dim);
asd=zeros(SearchAgents_no,dim);
if Boundary_no==1
    PositionsF=rand(SearchAgents_no,dim).*(ub-lb)+lb;
    
    BackPositions = ub + lb - PositionsF;
end

if Boundary_no>1
    for i=1:dim
        ub_i=ub(i);
        lb_i=lb(i);
        PositionsF(:,i)=rand(SearchAgents_no,1).*(ub_i-lb_i)+lb_i;
        
        if rand<rand
            
            lamda=1+rand*rand;
        else
            lamda=1-rand*rand;
        end
        BackPositions(:,i) =  (0.5+0.5*lamda)*(ub_i+lb_i) - lamda*PositionsF(:,i);
        for s=1:size(BackPositions,1)
            asd(s,i)=BackPositions(s,i).*(1 + randn());
            if BackPositions(s,i)<lb(i)
                BackPositions(s,i)=lb(i);
            end
            if BackPositions(s,i)>ub(i)
                BackPositions(s,i)=ub(i);
            end
            if asd(s,i)<lb(i)
                asd(s,i)=lb(i);
            end
            if asd(s,i)>ub(i)
                asd(s,i)=ub(i);
            end
        end
    end
end

AllPositionsTemp = [PositionsF;BackPositions];
AllPositions = AllPositionsTemp;
for i = 1:size(AllPositionsTemp,1)
    fitness(i) = fun(AllPositionsTemp(i,:));
end

AllPositionsTemp1 = [PositionsF;asd];
AllPositions1 = AllPositionsTemp1;
for i = 1:size(AllPositionsTemp1,1)
    fitness1(i) = fun(AllPositionsTemp1(i,:));
end

for i = 1:size(AllPositionsTemp1,1)
    if fitness(i)>fitness1(i)
        AllPositionsTemp(i,:)=AllPositionsTemp1(i,:);
    end
end

[fitness, index]= sort(fitness);
for i = 1:2*SearchAgents_no
    AllPositions(i,:) = AllPositionsTemp(index(i),:);
end
Positions = AllPositions(1:SearchAgents_no,:);
end




