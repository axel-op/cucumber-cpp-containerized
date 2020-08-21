project(Calculator)

cmake_minimum_required(VERSION 3.16)

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
find_package(Boost REQUIRED COMPONENTS thread system regex date_time program_options test)

add_library(${PROJECT_NAME} STATIC src/Calculator)
target_include_directories(${PROJECT_NAME} INTERFACE src)

add_executable(CalculatorSteps features/step_definitions/CalculatorSteps)
target_link_libraries(CalculatorSteps PRIVATE ${PROJECT_NAME} cucumber-cpp Threads::Threads Boost::thread Boost::system Boost::regex Boost::date_time Boost::program_options Boost::test)