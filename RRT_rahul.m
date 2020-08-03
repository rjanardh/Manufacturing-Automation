%run this script

clear;
    
                     
             
    iterations = 10^3;  
    step_no = 15;
    s1=1/step_no;  
    
    parent=[1];  %array to hold parent of nodes
    near_node=1; %qnear index
    tmax=0;
    edge=[0]; %edge info array
    
   %pose [theta1,theta2,theta 3] as stated in test data
    Q_initial=[20 5 5]*(pi/180);     
    Q_goal=[160 5 5]*(pi/180);
    
    Q_near=[10 0 0]*(pi/180);
    Q_new=[10 0 0]*(pi/180);
    
    %co-ordinates of obstacles
    Obst = [0 700 44; 575 575 38; -600 600 58; 800 350 10];
    
    J=[   ]; %array which stores nodes         
    J=[J;Q_initial]; %first node      




  for k=1:iterations  
        coin=rand(1)*100;  
        if(coin<=99)
            theta1=rand(1)*pi;
            theta2=rand(1)*pi/2;
            theta3=rand(1)*(-pi/2);
            
            Q_random=[theta1 theta2 theta3];  
        else
            Q_random=Q_goal;                          
        end
        

        z=2000; %temp distance variable
        [u,v]=size(J); 
        Q_near=J(1,1:v);
        
        for j=1:u
            rho=sqrt((J(j,1)-Q_random(1))^2+(J(j,2)-Q_random(2))^2+(J(j,3)-Q_random(3))^2);
            if(rho<z)
                Q_near=J(j,1:v);
                z=rho;
                near_node=j;
            end
        end
        
         %collision
        t=0;
        tmax=0;
      while t<1
        temp_theta1=(1-t)*Q_near(1)+(t)*Q_random(1);
        temp_theta2=(1-t)*Q_near(2)+(t)*Q_random(2);
        temp_theta3=(1-t)*Q_near(3)+(t)*Q_random(3);
        
        [Xc,Yc] = angular_position(temp_theta1,temp_theta2,temp_theta3);
        dCaLb = circle_line_intersection(Xc,Yc,Obst); %CaLb - Circle a line b

        if (dCaLb(1,1) < 0 || dCaLb(1,2) < 0 || dCaLb(1,3) < 0 || dCaLb(1,4) < 0|| dCaLb(2,1) < 0 || dCaLb(2,2) < 0 || dCaLb(2,3) < 0 || dCaLb(2,4) < 0 || dCaLb(3,1) < 0 || dCaLb(3,2) < 0 || dCaLb(3,3) < 0 || dCaLb(3,4) < 0 || dCaLb(4,1) < 0 || dCaLb(4,2) < 0 || dCaLb(4,3) < 0 || dCaLb(4,4) < 0 )
            break
        else
         tmax=t;
         Q_new=[temp_theta1 temp_theta2 temp_theta3];   
        end
        t=t+s1;
      end
      
      if (tmax~=0)
          if (tmax == 1-s1)             
              J = [J;Q_random];
              parent=[parent;near_node];    
              edge=[edge;1];
          else
              J = [J;Q_new];
              parent=[parent;near_node]; 
              edge=[edge;tmax];
          end        
          if (Q_new == Q_goal)
            Q_new
            Q_goal
            break  %ends if goal node is added
          end
      end
  end
 
%path Plot
    
     for k=1:u
      t1 = J(k,1);   
      t2 = J(k,2);
      t3 = J(k,3);
      
      if t1==0 && t2==0 && t3==0
          obj = 1; %objective found
      else
          obj = 0; %not found (false)
      end
  end

    [X_goal,Y_goal]=(angular_position(160*(pi/180),5*(pi/180),5*(pi/180)));
    [X_initial,Y_initial]=(angular_position(20*(pi/180),5*(pi/180),5*(pi/180)));
    
    for k=1:u
    [Xc,Yc] = angular_position(J(k,1),J(k,2),J(k,3));
    plot(Xc,Yc)
    
     hold on
    
    plot(X_initial,Y_initial,'c','LineWidth',5','LineStyle','-')
    plot(X_goal,Y_goal,'y','LineWidth',5,'LineStyle','-')
    viscircles([Obst(1,1) Obst(1,2)],Obst(1,3),'Color','r'); 
    viscircles([Obst(2,1) Obst(2,2)],Obst(2,3),'Color','b');
    viscircles([Obst(3,1) Obst(3,2)],Obst(3,3),'Color','g');
    viscircles([Obst(4,1) Obst(4,2)],Obst(4,3),'Color','k');
    end    