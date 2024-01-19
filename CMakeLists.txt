cmake_minimum_required(VERSION 3.16)

project(Fly VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appFly
    main.cpp
)
qt_add_qml_module(appFly
    URI Fly
    VERSION 1.0
    QML_FILES Main.qml
    RESOURCES
        ./res/bg-1.png
        ./res/bg-2.png
        ./res/bg-3.png
        ./res/prt0005_mesh.mesh
        ./res/shapes.frag
        ./res/shapes.vert
        ./res/white_granite.jpg


)
add_subdirectory(QFModule)
# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appFly PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appFly
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appFly
    PRIVATE Qt6::Quick
    QFModuleplugin
)

include(GNUInstallDirs)
install(TARGETS appFly
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
