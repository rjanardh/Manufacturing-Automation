function dCaLb=circle_line_intersection(Xc,Yc,Obst)


   % lines
     L1=[Xc(2)-Xc(1) Yc(2)-Yc(1)];
     L2=[Xc(3)-Xc(2) Yc(3)-Yc(2)];
     L3=[Xc(4)-Xc(3) Yc(4)-Yc(3)];
     L4=[Xc(6)-Xc(5) Yc(6)-Yc(5)];

     
     Obst = [0 700 44; 575 575 38; -600 600 58; 800 350 10]; %AS DEFINED

     %centre lines....C11 - circle 1 line 1
     %circle 1
     C11=[Obst(1,1)-Xc(1) Obst(1,2)-Yc(1)];
     C12=[Obst(1,1)-Xc(2) Obst(1,2)-Yc(2)];
     C13=[Obst(1,1)-Xc(3) Obst(1,2)-Yc(3)];
     C14=[Obst(1,1)-Xc(5) Obst(1,2)-Yc(5)];
     
     %c 2
     C21=[Obst(2,1)-Xc(1) Obst(2,2)-Yc(1)];
     C22=[Obst(2,1)-Xc(2) Obst(2,2)-Yc(2)];
     C23=[Obst(2,1)-Xc(3) Obst(2,2)-Yc(3)];
     C24=[Obst(2,1)-Xc(5) Obst(2,2)-Yc(5)];
     
     %c 3
     C31=[Obst(3,1)-Xc(1) Obst(3,2)-Yc(1)];
     C32=[Obst(3,1)-Xc(2) Obst(3,2)-Yc(2)];
     C33=[Obst(3,1)-Xc(3) Obst(3,2)-Yc(3)];
     C34=[Obst(3,1)-Xc(5) Obst(3,2)-Yc(5)];
     
     %c 4
     C41=[Obst(4,1)-Xc(1) Obst(4,2)-Yc(1)];
     C42=[Obst(4,1)-Xc(2) Obst(4,2)-Yc(2)];
     C43=[Obst(4,1)-Xc(3) Obst(4,2)-Yc(3)];
     C44=[Obst(4,1)-Xc(5) Obst(4,2)-Yc(5)];
 
 % projction of circle on line 
     %circle 1
     prj11 = dot(C11,L1/norm(L1));
     prj12 = dot(C12,L2/norm(L2));
     prj13 = dot(C13,L3/norm(L3));
     prj14 = dot(C14,L4/norm(L4));
     %c 2
     prj21= dot(C21,L1/norm(L1));
     prj22= dot(C22,L2/norm(L2));
     prj23= dot(C23,L3/norm(L3));
     prj24= dot(C24,L4/norm(L4));     
     %c 3
     prj31= dot(C31,L1/norm(L1));
     prj32= dot(C32,L2/norm(L2));
     prj33= dot(C33,L3/norm(L3));
     prj34= dot(C34,L4/norm(L4));     
     %c 4
     prj41= dot(C41,L1/norm(L1));
     prj42= dot(C42,L2/norm(L2));
     prj43= dot(C43,L3/norm(L3));
     prj44= dot(C44,L4/norm(L4));
     
 
 
 
     %circle 1 line 1
         if prj11 <=0
             c1L1=[Xc(1) Yc(1)]; % c1L1: closest point, circle 1 line 1
         elseif abs(prj11-norm(L1))<10^-4 || prj11-norm(L1)>0
             c1L1=[Xc(2) Yc(2)];
         else
             c1L1=[Xc(1) Yc(1)]+prj11*L1/norm(L1);
         end
     DC1L1= [Obst(1,1) Obst(1,2)] - c1L1;
     dC1L1= norm(DC1L1)-Obst(1,3); %d : delta
 
     %c 1 line 2
         if prj12 <=0
             c1L2=[Xc(2) Yc(2)];
         elseif abs(prj12-norm(L2))<10^-4 || prj12-norm(L2)>0
             c1L2=[Xc(3) Yc(3)];
         else
             c1L2=[Xc(2) Yc(2)]+prj12*L2/norm(L2);
         end
     DC1L2= [Obst(1,1) Obst(1,2)] - c1L2;
     dC1L2= norm(DC1L2)-Obst(1,3);
 
     %c 1 line 3
         if prj13 <=0
             c1L3=[Xc(3) Yc(3)];
         elseif abs(prj13-norm(L3))<10^-4 || prj13-norm(L3)>0
             c1L3=[Xc(4) Yc(4)];
         else
             c1L3=[Xc(3) Yc(3)]+prj13*L3/norm(L3);
         end
     DC1L3= [Obst(1,1) Obst(1,2)] - c1L3;
     dC1L3= norm(DC1L3)-Obst(1,3);
 
     %c 1 line 4
         if prj14 <=0
             c1L4=[Xc(5) Yc(5)];
         elseif abs(prj14-norm(L4))<10^-4 || prj14-norm(L4)>0
             c1L4=[Xc(6) Yc(6)];
         else
             c1L4=[Xc(5) Yc(5)]+prj14*L4/norm(L4);
         end
     DC1L4= [Obst(1,1) Obst(1,2)] - c1L4;
     dC1L4= norm(DC1L4)-Obst(1,3);
     

     %c 2 line 1
         if prj21 <=0
             c2L1=[Xc(1) Yc(1)];
         elseif abs(prj21-norm(L1))<10^-4 || prj21-norm(L1)>0
             c2L1=[Xc(2) Yc(2)];
         else
             c2L1=[Xc(1) Yc(1)]+prj21*L1/norm(L1);
         end
     DC2L1= [Obst(2,1) Obst(2,2)] - c2L1;
     dC2L1= norm(DC2L1)-Obst(2,3);

     %c 2 line 2
         if prj22 <=0
             c2L2=[Xc(2) Yc(2)];
         elseif abs(prj22-norm(L2))<10^-4 || prj12-norm(L2)>0
             c2L2=[Xc(3) Yc(3)];
         else
             c2L2=[Xc(2) Yc(2)]+prj22*L2/norm(L2);
         end
     DC2L2= [Obst(2,1) Obst(2,2)] - c2L2;
     dC2L2= norm(DC2L2)-Obst(2,3);

     %c 2 line 3
         if prj23 <=0
             c2L3=[Xc(3) Yc(3)];
         elseif abs(prj23-norm(L3))<10^-4 || prj23-norm(L3)>0
             c2L3=[Xc(4) Yc(4)];
         else
             c2L3=[Xc(3) Yc(3)]+prj23*L3/norm(L3);
         end
     DC2L3= [Obst(2,1) Obst(2,2)] - c2L3;
     dC2L3= norm(DC2L3)-Obst(2,3);

     %c 2 line 4
         if prj24 <=0
             c2L4=[Xc(5) Yc(5)];
         elseif abs(prj24-norm(L4))<10^-4 || prj24-norm(L4)>0
             c2L4=[Xc(6) Yc(6)];
         else
             c2L4=[Xc(5) Yc(5)]+prj24*L4/norm(L4);
         end
     DC2L4= [Obst(2,1) Obst(2,2)] - c2L4;
     dC2L4= norm(DC2L4)-Obst(2,3);
     

     %c 3 line 1
         if prj31 <=0
             c3L1=[Xc(1) Yc(1)];
         elseif abs(prj31-norm(L1))<10^-4 || prj31-norm(L1)>0
             c3L1=[Xc(2) Yc(2)];
         else
             c3L1=[Xc(1) Yc(1)]+prj31*L1/norm(L1);
         end
     DC3L1= [Obst(3,1) Obst(3,2)] - c3L1;
     dC3L1= norm(DC3L1)-Obst(3,3);

     %c 3 line 2
         if prj32 <=0
             c3L2=[Xc(2) Yc(2)];
         elseif abs(prj32-norm(L2))<10^-4 || prj32-norm(L2)>0
             c3L2=[Xc(3) Yc(3)];
         else
             c3L2=[Xc(2) Yc(2)]+prj32*L2/norm(L2);
         end
     DC3L2= [Obst(3,1) Obst(3,2)] - c3L2;
     dC3L2= norm(DC3L2)-Obst(3,3);

     %c 3 line 3
         if prj33 <=0
             c3L3=[Xc(3) Yc(3)];
         elseif abs(prj33-norm(L3))<10^-4 || prj33-norm(L3)>0
             c3L3=[Xc(4) Yc(4)];
         else
             c3L3=[Xc(3) Yc(3)]+prj33*L3/norm(L3);
         end
     DC3L3= [Obst(3,1) Obst(3,2)] - c3L3;
     dC3L3= norm(DC3L3)-Obst(3,3);

     %c 3 line 4
         if prj34 <=0
             c3L4=[Xc(5) Yc(5)];
         elseif abs(prj34-norm(L4))<10^-4 || prj34-norm(L4)>0
             c3L4=[Xc(6) Yc(6)];
         else
             c3L4=[Xc(5) Yc(5)]+prj34*L4/norm(L4);
         end
     DC3L4= [Obst(3,1) Obst(3,2)] - c3L4;
     dC3L4= norm(DC3L4)-Obst(3,3);


     %c 4 line 1
         if prj41 <=0
             c4L1=[Xc(1) Yc(1)];
         elseif abs(prj41-norm(L1))<10^-4 || prj41-norm(L1)>0
             c4L1=[Xc(2) Yc(2)];
         else
             c4L1=[Xc(1) Yc(1)]+prj41*L1/norm(L1);
         end
     DC4L1= [Obst(4,1) Obst(4,2)] - c4L1;
     dC4L1= norm(DC4L1)-Obst(4,3);

     %c 4 line 2
         if prj42 <=0
             c4L2=[Xc(2) Yc(2)];
         elseif abs(prj42-norm(L2))<10^-4 || prj42-norm(L2)>0
             c4L2=[Xc(3) Yc(3)];
         else
             c4L2=[Xc(2) Yc(2)]+prj42*L2/norm(L2);
         end
     DC4L2= [Obst(4,1) Obst(4,2)] - c4L2;
     dC4L2= norm(DC4L2)-Obst(4,3);

     %c 4 line 3
         if prj43 <=0
             c4L3=[Xc(3) Yc(3)];
         elseif abs(prj43-norm(L3))<10^-4 || prj43-norm(L3)>0
             c4L3=[Xc(4) Yc(4)];
         else
             c4L3=[Xc(3) Yc(3)]+prj43*L3/norm(L3);
         end
     DC4L3= [Obst(4,1) Obst(4,2)] - c4L3;
     dC4L3= norm(DC4L3)-Obst(4,3);

     %c4 l4
         if prj44 <=0
             c4L4=[Xc(5) Yc(5)];
         elseif abs(prj44-norm(L4))<10^-4 || prj44-norm(L4)>0
             c4L4=[Xc(6) Yc(6)];
         else
             c4L4=[Xc(5) Yc(5)]+prj44*L4/norm(L4);
         end
     DC4L4= [Obst(4,1) Obst(4,2)] - c4L4;
     dC4L4= norm(DC4L4)-Obst(4,3);
     

     
     dCaLb=[dC1L1,dC1L2,dC1L3,dC1L4;dC2L1,dC2L2,dC2L3,dC2L4;
    dC3L1,dC3L2,dC3L3,dC3L4;dC4L1,dC4L2,dC4L3,dC4L4];
end
 