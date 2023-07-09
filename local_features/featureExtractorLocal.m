function FeatVect = featureExtractorLocal(x,y,p)
    diff_x = diff_calc(x);
    diff_y = diff_calc(y);
    diff_p = diff_calc(p);

    diff1_x = diff_x(1);
    diff1_y = diff_y(1);
    diff1_p = diff_p(1);

    diff2_x = diff_x(2);
    diff2_y = diff_y(2);
    diff2_p = diff_p(2);

    theta = path_tangent_angle(diff1_x, diff1_y);
    vel_mag = path_vel_mag(diff1_x, diff1_y);

    diff_theta = diff_calc(theta);
    diff_velmag = diff_calc(vel_mag);

    diff1_theta = diff_theta(1);
    diff1_velmag = diff_velmag(1);

    FeatVect=[x, y, p, diff1_x, diff1_y, diff1_p, diff2_x, diff2_y, diff2_p];%, ...
%         theta, vel_mag];
end

