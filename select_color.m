function [O,mes] = select_color(I,color)
    %("What color do you want?\n1:Red     2:Green     3:Blue      4:Purple    5:Cyan      6:Yellow  7:Grey      8:Black and White\n");
    switch color
        case 1
            O=I;
            O(:,:,2:3)=0;
            mes="Red"; 
       case 2
            O=I;
            O(:,:,1:2:3)=0;          
            mes="Green";
       case 3
            O=I;
            O(:,:,1:2)=0;          
            mes="Blue";
       case 4
            O=I;
            O(:,:,2)=0;          
            mes="Purple";
       case 5
            O=I;
            O(:,:,1)=0;          
            mes="Cyan";
       case 6
            O=I;
            O(:,:,3)=0;           
            mes="Yellow";
        case 7
            O=I;
            O=O(:,:,1);
            mes="Grey";
        case 8
            O=im2bw(I);
            mes="Black and White";
        otherwise
            O=I;   
            mes="Invalid Input";
    end
end

