/**
 * @name Missing logging in exception block
 * @description Alerts if an exception block does not contain logging statements.
 * @kind problem
 * @problem.severity warning
 * @tags maintainability best-practice
 */

import java

// Predicate to identify logging calls
predicate isLoggingMethod(MethodAccess loggingCall) {
  loggingCall.getMethod().getDeclaringType().getName().matches("%Logger%")
  or loggingCall.getMethod().getName() = "log"
}

// Predicate to check if a catch block contains logging
predicate hasLogging(CatchClause catchBlock) {
  exists(MethodAccess loggingCall |
    loggingCall.getEnclosingStmt() = catchBlock.getBlock().getAStmt() and
    isLoggingMethod(loggingCall)
  )
}

// Find catch blocks without logging
from CatchClause catchBlock
where not hasLogging(catchBlock)
select catchBlock, "This catch block does not contain any logging."
