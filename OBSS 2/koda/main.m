[ d, entropyTE, entropyTL, entropyPE, entropyPL ] = getAllSampEn(11);
[ d, te, tl, pe, pl ] = getRecClasses;

dTE = getDate( d, te );
dTL = getDate( d, tl );
dPE = getDate( d, pe );
dPL = getDate( d, pl );
N = 4;
figure();
plot(dTE,entropyTE(:,N),'o', 'MarkerFaceColor','r'); hold on;
plot(dTL,entropyTL(:,N),'o','MarkerFaceColor','r'); hold on;
plot(dPE,entropyPE(:,N),'o', 'MarkerFaceColor','b'); hold on;
plot(dPL,entropyPL(:,N),'o', 'MarkerFaceColor','b'); hold on;
line([26,26],[0,1.2],'Color','black','LineStyle',':'); hold on;
line([20,26],[mean(entropyTE(:,N)),mean(entropyTE(:,N))],'Color','black','LineStyle','--'); hold on;
line([26,36],[mean(entropyTL(:,N)),mean(entropyTL(:,N))],'Color','black','LineStyle','--'); hold on;
line([20,26],[mean(entropyPE(:,N)),mean(entropyPE(:,N))],'Color','black'); hold on;
line([26,36],[mean(entropyPL(:,N)),mean(entropyPL(:,N))],'Color','black'); hold on;
xlabel('Èas meritve[teden]')
ylabel('Vzorèna entropija')
[p1,p2,p3,p4,p5,p6] = getP( entropyTE, entropyTL, entropyPE, entropyPL, N )



[ d, entropyTE2, entropyTL2, entropyPE2, entropyPL2 ] = getAllSampEn(7);

figure();
plot(dTE,entropyTE2(:,N),'o', 'MarkerFaceColor','r'); hold on;
plot(dTL,entropyTL2(:,N),'o','MarkerFaceColor','r'); hold on;
plot(dPE,entropyPE2(:,N),'o', 'MarkerFaceColor','b'); hold on;
plot(dPL,entropyPL2(:,N),'o', 'MarkerFaceColor','b'); hold on;
line([26,26],[0,1.2],'Color','black','LineStyle',':'); hold on;
line([20,26],[mean(entropyTE2(:,N)),mean(entropyTE2(:,N))],'Color','black','LineStyle','--'); hold on;
line([26,36],[mean(entropyTL2(:,N)),mean(entropyTL2(:,N))],'Color','black','LineStyle','--'); hold on;
line([20,26],[mean(entropyPE2(:,N)),mean(entropyPE2(:,N))],'Color','black'); hold on;
line([26,36],[mean(entropyPL2(:,N)),mean(entropyPL2(:,N))],'Color','black'); hold on;
xlabel('Èas meritve[teden]')
ylabel('Vzorèna entropija')
[p12,p22,p32,p42,p52,p62] = getP( entropyTE2, entropyTL2, entropyPE2, entropyPL2, N )
