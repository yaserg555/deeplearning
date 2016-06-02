clear all;
clc;

%sensors = dlmread('thouzands.txt');
sensors = dlmread('t.csv');

chest_x = sensors(:,2);
chest_y = sensors(:,3);
chest_z = sensors(:,4);
waist_x = sensors(:,5);
waist_y = sensors(:,6);
waist_z = sensors(:,7);
right_x = sensors(:,8);
right_y = sensors(:,9);
right_z = sensors(:,10);

for i = 1 : 26
    chest_x_i = chest_x((i*1000 - 999):(i*1000));
    chest_y_i = chest_y((i*1000 - 999):(i*1000));
    chest_z_i = chest_z((i*1000 - 999):(i*1000));
    waist_x_i = waist_x((i*1000 - 999):(i*1000));
    waist_y_i = waist_y((i*1000 - 999):(i*1000));
    waist_z_i = waist_z((i*1000 - 999):(i*1000));
    right_x_i = right_x((i*1000 - 999):(i*1000));
    right_y_i = right_y((i*1000 - 999):(i*1000));
    right_z_i = right_z((i*1000 - 999):(i*1000));
    if (rem(i,6) == 1)
        figure;
    end
    if (rem(i,6) == 0)
        subplot(2,3,6); 
    else
        subplot(2,3,rem(i,6));
    end;
    plot3(chest_x_i,chest_y_i,chest_z_i,'r',waist_x_i,waist_y_i,waist_z_i,'g',right_x_i,right_y_i,right_z_i,'b');
    title(sensors(i*1000));
end

