#import <tensorflow/core/public/session.h>

//#import "ViewController.h"

- (BOOL)loadGraphFromPath:(NSString *)path
{
    auto status = ReadBinaryProto(tensorflow::Env::Default(),
                                  path.fileSystemRepresentation, &graph);
    if (!status.ok()) {
        NSLog(@"Error reading graph: %s", status.error_message().c_str());
        return NO;
    }
    return YES;
}

- (BOOL)createSession
{
    tensorflow::SessionOptions options;
    auto status = tensorflow::NewSession(options, &session);
    if (!status.ok()) {
        NSLog(@"Error creating session: %s",
              status.error_message().c_str());
        return NO;
    }
    
    status = session->Create(graph);
    if (!status.ok()) {
        NSLog(@"Error adding graph to session: %s",
              status.error_message().c_str());
        return NO;
    }
    return YES;
}

std::vector<std::pair<std::string, tensorflow::Tensor>> inputs = {
    {"inputs/x-input", x}
};

std::vector<std::string> nodes = {
    {"model/y_pred"},
    {"inference/inference"}
};

std::vector<tensorflow::Tensor> outputs;

auto status = session->Run(inputs, nodes, {}, &outputs);
if (!status.ok()) {
    NSLog(@"Error running model: %s", status.error_message().c_str());
    return;
}

auto y_pred = outputs[0].tensor<float, 2>();
NSLog(@"Probability spoken by a male: %f%%", y_pred(0, 0));

auto isMale = outputs[1].tensor<float, 2>();
if (isMale(0, 0)) {
    NSLog(@"Prediction: male");
} else {
    NSLog(@"Prediction: female");
}
