function [x,y] = angular_position(temp_theta1,temp_theta2,temp_theta3)


% given lengths 
    l1=500;
    l2=300;
    l3=100; 
    l4=50; 
    
    %(x,y) positions based on joint co-ordinates - http://courses.csail.mit.edu/6.141/spring2011/pub/lectures/Lec14-Manipulation-II.pdf
    a1=0;
    a2=l1*cos(temp_theta1);
    a3=l1*cos(temp_theta1)+l2*cos(temp_theta1+temp_theta2);
    a4=l1*cos(temp_theta1)+l2*cos(temp_theta1+temp_theta2)+l3*cos(temp_theta1+temp_theta2+temp_theta3);
    a5=cos(temp_theta1 + temp_theta2 + temp_theta3)*l3 - (sin(temp_theta1 + temp_theta2 + temp_theta3)*l4)/2 + l2*cos(temp_theta1 + temp_theta2) + l1*cos(temp_theta1);
    a6=cos(temp_theta1 + temp_theta2 + temp_theta3)*l3 + (sin(temp_theta1 + temp_theta2 + temp_theta3)*l4)/2 + l2*cos(temp_theta1 + temp_theta2) + l1*cos(temp_theta1);
  
    b1=0;
    b2=l1*sin(temp_theta1);
    b3=l1*sin(temp_theta1)+l2*sin(temp_theta1+temp_theta2);
    b4=l1*sin(temp_theta1)+l2*sin(temp_theta1+temp_theta2)+l3*sin(temp_theta1+temp_theta2+temp_theta3);
    b5=(cos(temp_theta1 + temp_theta2 + temp_theta3)*l4)/2 + sin(temp_theta1 + temp_theta2 + temp_theta3)*l3 + l2*sin(temp_theta1 + temp_theta2) + l1*sin(temp_theta1);
    b6=sin(temp_theta1 + temp_theta2 + temp_theta3)*l3 - (cos(temp_theta1 + temp_theta2 + temp_theta3)*l4)/2 + l2*sin(temp_theta1 + temp_theta2) + l1*sin(temp_theta1);
    
    x=[a1;a2;a3;a4;a5;a6];
    y=[b1;b2;b3;b4;b5;b6];
end