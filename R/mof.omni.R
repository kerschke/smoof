#' @title
#' MMF13 Function
#'
#' @description
#' Test problem from the set of "multimodal multiobjective functions" as for
#' instance used in the CEC2019 competition.
#'
#' @references
#' Caitong Yue, Boyang Qu, Kunjie Yu, Jing Liang, and Xiaodong Li, "A novel
#' scalable test problem suite for multimodal multiobjective optimization," in
#' Swarm and Evolutionary Computation, Volume 48, August 2019, pp. 62–71, Elsevier.
#'
#' @return [\code{smoof_multi_objective_function}]
#' @export
makeOmniTestFunction = function() {
  # C implementation
  fn = function(x) {
    assertNumeric(x, len = 2L, any.missing = FALSE, all.missing = FALSE, finite = TRUE)
    return(mof_cec2019_OMNI_Test(x = x))
  }

  n.objectives = 2L
  makeMultiObjectiveFunction(
    name = "Omni test function",
    id = sprintf("Omni-test-%id-%io", 2L, n.objectives),
    description = "Omni test function",
    fn = fn,
    par.set =  makeNumericParamSet(
      len = 2L,
      id = "x",
      lower = rep(0, 2L),
      upper = rep(6, 2L),
      vector = TRUE
    ),
    minimize = rep(TRUE, n.objectives),
    n.objectives = n.objectives
  )
}

class(makeOmniTestFunction) = c("function", "smoof_generator")
attr(makeOmniTestFunction, "name") = c("Omni test")
attr(makeOmniTestFunction, "type") = c("multi-objective")
attr(makeOmniTestFunction, "tags") = c("multi-objective")
