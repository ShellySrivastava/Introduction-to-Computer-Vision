function [] = ICV_LBP_classifier(input_image, w_size)
%ICV_LBP_classifier
%   Takes input image and window size to classify images as face or car
% -1 window size means global descriptor

    car = imread('car-1.jpg');
    face = imread('face-1.jpg');
    [row col] = size(car);
    if(w_size == -1)
        
        [LBP_face, LBP_hist_face] = ICV_LBP(face, -1);

        [LBP_car, LBP_hist_car] = ICV_LBP(car, -1);

        [LBP_img, LBP_hist] =ICV_LBP(input_image, -1);

        face_intersection = ICV_hist_intersection(LBP_hist_face, LBP_hist);
        car_intersection = ICV_hist_intersection(LBP_hist_car, LBP_hist);

        if(face_intersection > car_intersection)
            disp("It is a face");
        else
            disp("It is a car");
        end
    else
        array_classification = [];
        for i = 1: w_size :row - w_size +1
            for j = 1: w_size :col - w_size +1
                window_face = face(i: i+w_size -1, j:j+w_size-1);
                window_car = car(i: i+w_size -1, j:j+w_size-1);
                window_input = input_image(i: i+w_size -1, j:j+w_size-1);
                
                LBP_image_f = ICV_LBP_calculator(window_face);
                LBP_hist_f = ICV_histogram(LBP_image_f);
                
                LBP_image_c = ICV_LBP_calculator(window_car);
                LBP_hist_c = ICV_histogram(LBP_image_c);
                
                LBP_image_i = ICV_LBP_calculator(window_input);
                LBP_hist_i = ICV_histogram(LBP_image_i);
                
                face_intersection = ICV_hist_intersection(LBP_hist_f, LBP_hist_i);
                car_intersection = ICV_hist_intersection(LBP_hist_c, LBP_hist_i);

                if(face_intersection > car_intersection)
                    array_classification = [array_classification 0];
                    disp("window level: It is a face");
                else
                    disp("window level: It is a car");
                    array_classification = [array_classification 1];
                end
            end
        end
        if(mode(array_classification)==0)
            disp("it is a face");
        else
            disp("it is a car");
        end
    end
    
end

