# Cucumber-CPP containerized (PoC)

This repo contains an example Cucumber-CPP project, copied from the [Cucumber-CPP repository](https://github.com/cucumber/cucumber-cpp/tree/master/examples/Calc), and a Dockerfile to test this project with a single docker command, without needing to install Cucumber-CPP locally.

If you edit the .cpp files, don't forget to edit the [CMakeLists.txt](CMakeLists.txt) too.

Once it's done, run the following command to compile, build, and test all your features:

```bash
docker build . -t cucumber-cpp-container && docker run cucumber-cpp-container
```
