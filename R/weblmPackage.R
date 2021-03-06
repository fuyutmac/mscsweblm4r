
#' @title R Client for the Microsoft Cognitive Services Web Language Model REST API
#'
#' @description \pkg{mscsweblm4r} is a client/wrapper/interface for the Microsoft
#' Cognitive Services (MSCS) Web Language Model (Web LM) REST API. To use this
#' package, you MUST have a valid account with \url{https://www.microsoft.com/cognitive-services}.
#' Once you have an account, Microsoft will provide you with a (free) API key
#' you can use with this package.
#'
#' @section The MSCS Web LM REST API:
#'
#' Microsoft Cognitive Services -- formerly known as Project Oxford -- are a set
#' of APIs, SDKs and services that developers can use to add AI features to
#' their apps. Those features include emotion and video detection; facial,
#' speech and vision recognition; and speech and language understanding.
#'
#' The Web Language Model REST API provides tools for natural language
#' processing and is documented at \url{https://www.microsoft.com/cognitive-services/en-us/web-language-model-api/documentation}.
#
#' Per Microsoft's website, this API uses smoothed backoff N-gram language models
#' (supporting Markov order up to 5) that were trained on four web-scale American
#' English corpora collected by Bing (web page body, title, anchor and query).
#'
#' The MSCS Web LM REST API supports the following lookup operations:
#'
#' \itemize{
#'  \item Insert spaces into a string of words adjoined together without any spaces (hashtags, URLs, etc.).
#'  \item Calculate the joint probability that a sequence of words will appear together.
#'  \item Compute the conditional probability that a specific word will follow an existing sequence of words.
#'  \item Get the list of words (completions) most likely to follow a given sequence of words.
#'  \item Retrieve the list of supported language models.
#' }
#'
#' @section \pkg{mscsweblm4r} Functions:
#'
#' The following five \pkg{mscsweblm4r} core functions are used to wrap the
#' MSCS Web LM REST API:
#'
#' \itemize{
#'  \item Word breaking - \code{\link{weblmBreakIntoWords}} function
#'  \item Joint probability - \code{\link{weblmCalculateJointProbability}} function
#'  \item Conditional probability - \code{\link{weblmCalculateConditionalProbability}} function
#'  \item Sequence completions - \code{\link{weblmGenerateNextWords}} function
#'  \item Models list - \code{\link{weblmListAvailableModels}} function
#' }
#'
#' The \code{\link{weblmInit}} configuration function is used to set the REST
#' API URL and the private API key. It needs to be called \emph{only once},
#' after package load, or the core functions will not work properly.
#'
#' @section Package Loading and Configuration:
#'
#' After loading the \pkg{mscsweblm4r} package with the \code{library()} function,
#' you must call the \code{\link{weblmInit}} before you can call any of
#' the core \pkg{mscsweblm4r} functions.
#'
#' The \code{\link{weblmInit}} configuration function will first check to see
#' if the variable \code{MSCS_WEBLANGUAGEMODEL_CONFIG_FILE} exists in the system
#' environment. If it does, the package will use that as the path to the
#' configuration file.
#'
#' If \code{MSCS_WEBLANGUAGEMODEL_CONFIG_FILE} doesn't exist, it will look for
#' the file \code{.mscskeys.json} in the current user's home directory (that's
#' \code{~/.mscskeys.json} on Linux, and something like \code{C:/Users/Phil/Documents/.mscskeys.json}
#' on Windows). If the file is found, the package will load the API key and URL
#' from it.
#'
#' If using a file, please make sure it has the following structure:
#'
#' \preformatted{
#' {
#'   "weblanguagemodelurl": "https://api.projectoxford.ai/text/weblm/v1.0/",
#'   "weblanguagemodelkey": "...MSCS Web Language Model API key goes here..."
#' }
#' }
#'
#' If no configuration file is found, \code{\link{weblmInit}} will attempt to
#' pick up its configuration information from two Sys env variables instead:
#'
#' \code{MSCS_WEBLANGUAGEMODEL_URL} - the URL for the Web LM REST API.
#'
#' \code{MSCS_WEBLANGUAGEMODEL_KEY} - your personal Web LM REST API key.
#'
#' @section S3 Object of the Class \code{\link{weblm}}:
#'
#' The five core functions of the \pkg{mscsweblm4r} package return S3 objects
#' of the class \code{\link{weblm}}. Those objects expose formatted results, the REST
#' API JSON response, and the HTTP request.
#'
#' @section Error Handling:
#'
#' The MSCS Web LM API is a REST API. HTTP requests over a network and the
#' Internet can fail because of congestion, because the web site is down for
#' maintenance, because of firewall configuration issues, etc.
#'
#' The API can also fail if you've exhausted your call volume quota or are
#' exceeding the API calls rate limit. Unfortunately, MSCS does not expose an
#' API you can query to check if you're about to exceed your quota for instance.
#' The only way you'll know for sure is by looking at the error code returned
#' after an API call has failed.
#'
#' To help with error handling, we recommend the systematic use of
#' \code{tryCatch()} when calling \pkg{mscsweblm4r}'s core functions. Its
#' mechanism may appear a bit daunting at first, but it is well documented at \url{http://www.inside-r.org/r-doc/base/signalCondition}.
#' We use it in many of the code examples.
#'
#' @importFrom methods is
#' @importFrom httr add_headers content http_condition content_type_json
#' @importFrom jsonlite fromJSON toJSON
#' @importFrom pander pandoc.table panderOptions
#' @name mscsweblm4r
#' @docType package
#' @author Phil Ferriere \email{pferriere@hotmail.com}
#' @keywords package
NULL
