%_________________________________________________________________________%
%ÏóÈºËã·¨             %
%_________________________________________________________________________%
function [Best_pos,Best_score,curve]=EHO(pop,Max_iter,lb,ub,dim,fobj)

if(max(size(ub)) == 1)
    ub = ub.*ones(1,dim);
    lb = lb.*ones(1,dim);
end

X0=initializationNew(pop,dim,ub,lb,fobj);
X = X0;
fitness = zeros(1,pop);
for i = 1:pop
    fitness(i) =  fobj(X(i,:));
end
[fitness, index]= sort(fitness);
GBestF = fitness(1);
for i = 1:pop
    X(i,:) = X0(index(i),:);
end
GBestX = X(1,:);
curve=zeros(1,Max_iter);
X_new = X;
        
    aa=-pi;
    b=pi;
    gold=double((sqrt(5)-1)/2);      
    x1=aa+(1-gold)*(b-aa);            
    x2=aa+gold*(b-aa);               
    
for t = 1: Max_iter
    for j = 2:pop
                alpha = rand();
        r = rand();
        X_new(j,:) = X(j,:) + alpha.*(X(j,:) - GBestX).*r;
    end
    r=rand;
    r1=(2*pi)*r;
    r2=r*pi;
    for jj=1:size(X,2) 
        X_new(1,jj)= X_new(1,jj)*abs(sin(r1)) - r2*sin(r1)*abs(x1*X_new(1,jj)-x2*X_new(1,jj));
    end
 
     Boundary_Ub=X_new(1,:)>ub;
        Boundary_Lb=X_new(1,:)<lb;
        X_new(1,:)=(X_new(1,:).*(~(Boundary_Ub+Boundary_Lb)))+ub.*Boundary_Ub+lb.*Boundary_Lb;
        Destination_values(1,i)=fobj(X_new(1,:));
        if Destination_values(1,i)<GBestF
            GBestX=X_new(1,:);
            GBestF=Destination_values(1,i);
            b=x2;
            x2=x1;
            x1=aa+(1-gold)*(b-aa);
        else
            aa=x1;
            x1=x2;
            x2=aa+gold*(b-aa);
            
        end
        
        if x1==x2
            aa=-pi*rand; 
            b=pi*rand;
            x1=aa+(1-gold)*(b-aa); 
            x2=aa+gold*(b-aa);
            
        end
    for j=1:pop
        fitness_new(j) = fobj(X_new(j,:));
    end
    [fitness_new, index]= sort(fitness_new);
    BestF = fitness_new(1);
    WorstF = fitness_new(end);
    for j = 1:pop
        X_new(j,:) = X_new(index(j),:);
    end
        X_new(pop,:) = lb + (ub - lb + 1).*rand();
    for j = 1:pop
        for a = 1: dim
            if(X_new(j,a)>ub)
                X_new(j,a) =ub(a);
            end
            if(X_new(j,a)<lb)
                X_new(j,a) =lb(a);
            end
        end
    end
    for j=1:pop
        fitness_new(j) = fobj(X_new(j,:));
    end
    for j = 1:pop
        if(fitness_new(j) < GBestF)
            GBestF = fitness_new(j);
            GBestX = X_new(j,:);
        end
    end
    X = X_new;
    fitness = fitness_new;
    [fitness, index]= sort(fitness);
    BestF = fitness(1);
    WorstF = fitness(end);
    for j = 1:pop
        X(j,:) = X(index(j),:);
    end
    curve(t) = GBestF;
    zxc=0;
    if curve(t)==0
        zxc=zxc+1;
    end
end
Best_pos = GBestX;
Best_score = curve(end);
end



