function [ Features ] = GLCM_Features(img ,ST)
    MatrixGLCM=GLCM(img,ST);
    contrastGLCM=ContrastGLCM(MatrixGLCM);
    energyGLCM=EnergyGLCM(MatrixGLCM);
    entopyGLCM=EntropyGLCM(MatrixGLCM);
    homogeneityGLCM=HomogeneityGLCM(MatrixGLCM);
    Features=[contrastGLCM energyGLCM entopyGLCM homogeneityGLCM];
end

