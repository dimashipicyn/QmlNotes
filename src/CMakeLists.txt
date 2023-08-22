set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON) 
set(CMAKE_AUTOUIC ON)

add_executable(${PROJECT_NAME}
  main.cpp
  
  
  resources.qrc
)

find_package(Qt5 REQUIRED COMPONENTS Widgets Core Qml Quick QuickControls2)

target_link_libraries(${PROJECT_NAME} PRIVATE
  Qt5::Widgets
  Qt5::Qml
  Qt5::Quick
  Qt5::Core
)

target_include_directories(${PROJECT_NAME} PUBLIC
  qml
)