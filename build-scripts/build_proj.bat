cd ../
set working_dir=%cd%
set library_binaries=%working_dir%\library_binaries

echo Creating Home for libs
cd %working_dir%
if not exist "library_binaries" mkdir library_binaries

echo Installing Glew
cd external\glew-cmake-2.2.0
if not exist "build" mkdir build
cd build
cmake -G "Visual Studio 17 2022" -A x64 -DCMAKE_BUILD_TYPE=Release -S ./../ -B "x64"
cmake --build x64 --config Release --parallel
cmake --install x64 --prefix %library_binaries% --config Release
copy %working_dir%\external\glew-cmake-2.2.0\build\x64\bin\Release\glew-shared.dll %library_binaries%\bin
cd ../../..
echo Glew Installed

echo Installing Assimp
cd external\assimp-5.2.5
if not exist "build" mkdir build
cd build
cmake -G "Visual Studio 17 2022" -A x64 -DCMAKE_BUILD_TYPE=Release -S ./../ -B "x64"
cmake --build x64 --config Release --parallel
cmake --install x64 --prefix %library_binaries% --config Release 
cd ../../..
echo Assimp Installed

echo Installing Glm
cd external\glm-0.9.9.8
if not exist "build" mkdir build
cd build
cmake -G "Visual Studio 17 2022" -A x64 -DCMAKE_BUILD_TYPE=Release -S ./../ -B "x64"
cmake --build x64 --config Release --parallel
cmake --install x64 --prefix %library_binaries% --config Release 
cd ../../..
echo Glm Installed
echo All libraries are installed

echo Installing SDL
cd external\sdl-2.26.1
if not exist "build" mkdir build
cd build
cmake -G "Visual Studio 17 2022" -A x64 -DCMAKE_BUILD_TYPE=Release -S ./../ -B "x64"
cmake --build x64 --config Release --parallel
cmake --install x64 --prefix %library_binaries% --config Release 
cd ../../..
echo SDL Installed

echo Installing SDL_Image
cd external\sdl_image-2.6.2
if not exist "build" mkdir build
cd build
cmake -G "Visual Studio 17 2022" -A x64 -DCMAKE_BUILD_TYPE=Release -S ./../ -B "x64" -DCMAKE_PREFIX_PATH=%library_binaries%
cmake --build x64 --config Release --parallel
cmake --install x64 --prefix %library_binaries% --config Release 
cd ../../..
echo SDL_Image Installed

echo Installing SDL_Mixer
cd external\sdl_mixer-2.6.2
if not exist "build" mkdir build
cd build
cmake -G "Visual Studio 17 2022" -A x64 -DCMAKE_BUILD_TYPE=Release -S ./../ -B "x64" -DCMAKE_PREFIX_PATH=%library_binaries%
cmake --build x64 --config Release --parallel
cmake --install x64 --prefix %library_binaries% --config Release 
cd ../../..
echo SDL_Mixer Installed

echo Installing SDL_TTF
cd external\sdl_ttf-2.20.1
if not exist "build" mkdir build
cd build
cmake -G "Visual Studio 17 2022" -A x64 -DCMAKE_BUILD_TYPE=Release -S ./../ -B "x64" -DCMAKE_PREFIX_PATH=%library_binaries%
cmake --build x64 --config Release --parallel
cmake --install x64 --prefix %library_binaries% --config Release 
cd ../../..
echo SDL_TTF Installed

if not exist "build" mkdir build
cd build
cmake -G "Visual Studio 17 2022" -A x64 -DCMAKE_BUILD_TYPE=Release -S ./../ -DCMAKE_PREFIX_PATH=%library_binaries%
cmake --build . --config Release --parallel
echo Project built successfully
pause