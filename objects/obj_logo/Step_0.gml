if (appear && image_alpha >= 1) appear = false;
if (!appear && image_alpha <= 0.3) appear = true;

image_alpha += (appear)? 0.005 : -0.005;