function W=migradiente(x,y)
[N,d]=size(x);
W=rand(d+1,1);
MaxIter=200;
Eta=0.01;
x2=[x,ones(N,1)];
%Error=[];
%Itera=[];

for iter=1:MaxIter
    %-----------
    %subplot(1,2,1);
    plot(x(1:100,1),x(1:100,2),'xr');
    hold on
    plot(x(101:end,1),x(101:end,2),'xb');
    %---------------------------
    r=linspace(min(x(:,1)), max(x(:,1)),10);
    z=-(W(1)/W(2))*r-W(3)/W(2);
    plot(r,z,'k');
    hold off
    %---------------------
    %subplot(1,2,2)
    
    %Itera=[Itera,iter];
    %error=%%----------Falta esto----------%%
%     Error=[Error,error];
%     plot(Itera,Error);
    pause(0.5);
    
    for j=1:d+1 %--for pesos
        sum=0;
        for i=1:N %---for muestras
            sum2=0;
            for k=1:d+1 %--for variables
                sum2=sum2+W(k)*x2(i,k);
            end
            sum=sum+(misigmoide(sum2)-y(i))*x2(i,j);
        end
        W(j)= W(j)-Eta*sum/N;
    end
end
