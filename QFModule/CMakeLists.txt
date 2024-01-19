
set(QML_IMPORT_PATH ${CMAKE_BINARY_DIR}/QFModule ${CMAKE_BINARY_DIR}/imports CACHE STRING "" FORCE)
find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Gui)
INCLUDE_DIRECTORIES(QFModule ./Control)
add_library(QFModule STATIC
    ./Control/ImageItem.h
    ./Control/ImageItem.cpp
        QFInit.hpp
)
qt_add_qml_module(QFModule
    URI QFModule
    VERSION 1.0
    QML_FILES
        ./Control/QFButton.qml
        ./Control/QFProgress.qml
        ./Control/QFUpload.qml
        ./Control/QFImgWindow.qml
    RESOURCES
        ./Image/button.png
        ./Image/button-d.png
        ./Image/light.png
        ./Image/upload.png
        ./Image/upload-d.png
    SOURCES
        ./Control/ImageItem.cpp
        ./Control/ImageItem.h
)
target_link_libraries(QFModule
        PRIVATE Qt6::Quick
        Qt6::Gui
)

