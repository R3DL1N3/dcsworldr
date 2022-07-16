#' Run Lua Interpreter
#'
#' @description Executes DCS World's \code{luae.exe} Lua 5.1.5 interpreter.
#'
#' @details You do not need to shell-quote standard input, as you might expect.
#'   However, you \emph{do} need to quote for Lua snippets passing through the
#'   command line arguments. See examples.
#'
#' @inheritDotParams base::system2
#' @export
#' @examples
#' \dontrun{
#' library(dcsworldr)
#'
#' luae.exe()
#' #> Lua 5.1.5  Copyright (C) 1994-2012 Lua.org, PUC-Rio
#' #> >
#'
#' luae.exe(input = "print(123)")
#' luae.exe(input = 'print("hello world")', stdout = TRUE)
#' luae.exe(c("-e", shQuote('print("hello world")')), stdout = TRUE)
#' luae.exe(c("-e", "io.write(package.path)"), stdout = TRUE)
#' luae.exe(c("-e", "io.write(package.cpath)"), stdout = TRUE)
#'
#' # https://www.lua.org/pil/8.2.html
#' luae.exe(c("-e",
#'   shQuote("assert(package.loadlib('lua-socket', 'luaopen_socket_core'))()")))
#' }
luae.exe <- function(...) {
  system2(openbeta_server.path("bin", "luae.exe"), ...)
}
