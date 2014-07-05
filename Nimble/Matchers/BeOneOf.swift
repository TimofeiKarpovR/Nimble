import Foundation
import Nimble

func beOneOf<T: Equatable>(allowedValues: T[]) -> MatcherFunc<T> {
    return MatcherFunc { actualExpression, failureMessage in
        failureMessage.postfixMessage = "be one of: \(stringify(allowedValues))"
        let actualValue = actualExpression.evaluate()
        return contains(allowedValues, actualValue)
    }
}