function theta = path_tangent_angle(diff1_x, diff1_y)
    theta = atan(diff1_y{1}./diff1_x{1});
    theta(isnan(theta)) = 0;
end

