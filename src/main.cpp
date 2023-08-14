#include <iostream>
#include <Eigen/Dense>
#include <gtsam/geometry/Pose2.h>
#include <gtsam/nonlinear/NonlinearFactorGraph.h>
#include <gtsam/nonlinear/Values.h>
#include <gtsam/inference/Symbol.h>
#include <gtsam/slam/PriorFactor.h>
#include <gtsam/nonlinear/GaussNewtonOptimizer.h>

using namespace std;
using namespace gtsam;

using Eigen::MatrixXd;

int run_gtsam_test();

int main()
{

    MatrixXd m(2, 2);
    m(0, 0) = 3;
    m(1, 0) = 2.5;
    m(0, 1) = -1;
    m(1, 1) = m(1, 0) + m(0, 1);
    std::cout << m << std::endl;

    run_gtsam_test();
}

using namespace std;
using namespace gtsam;

// Just a simple example to exercise the parts of the gtsam api to make sure
// everything is building correctly.   I actually have very little knowledge
// of what this is doing but plucked this from one of the examples.
int run_gtsam_test()
{
    // Create a factor graph
    NonlinearFactorGraph graph;

    // Create a variable with an initial value
    double initial_value = 2.0;
    Values initial_estimate;
    initial_estimate.insert(Symbol('x', 1), initial_value);

    // Create a prior factor
    noiseModel::Diagonal::shared_ptr prior_noise = noiseModel::Isotropic::Sigma(1, 0.1);
    graph.emplace_shared<PriorFactor<double>>(Symbol('x', 1), initial_value, prior_noise);

    // Optimize the graph
    GaussNewtonOptimizer optimizer(graph, initial_estimate);
    Values result = optimizer.optimize();

    // Get the optimized value
    double optimized_value = result.at<double>(Symbol('x', 1));

    cout << "Initial value: " << initial_value << endl;
    cout << "Optimized value: " << optimized_value << endl;

    return 0;
}