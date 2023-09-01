function [O,mes]= encrypt(I,select)
    %("What do you want to do to the image?\n1:Gaussian  2:Poisson   3:Salt&Pepper  4:Speckle\n");
    switch select
        case 1
            O=imnoise(I,"gaussian",0.2,0.1);
            mes="Gaussian";
        case 2
            O=imnoise(I,"poisson");
            mes="Poisson";
        case 3
            O=imnoise(I,"salt & pepper",0.2);
            mes="Salt&Pepper";
        case 4
            O=imnoise(I,"speckle",0.2);
            mes="Speckle";
        otherwise
            O=I;
            mes="Invalid Input!";
    end
end

