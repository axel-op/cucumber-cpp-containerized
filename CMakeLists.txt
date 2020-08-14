project(Calculator)

cmake_minimum_required(VERSION 3.16)

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
find_package(Boost REQUIRED COMPONENTS unit_test_framework regex thread program_options filesystem)

add_library(${PROJECT_NAME} STATIC src/Calculator)
target_include_directories(${PROJECT_NAME} INTERFACE src)

add_executable(CalculatorSteps features/step_definitions/CalculatorSteps)
target_link_libraries(CalculatorSteps PRIVATE ${PROJECT_NAME} cucumber-cpp Threads::Threads ${Boost_LIBRARIES})