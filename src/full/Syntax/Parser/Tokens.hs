
module Syntax.Parser.Tokens
    ( Token(..)
    , Keyword(..)
    , layoutKeywords
    , Symbol(..)
    ) where

import Syntax.Common (Name, QName, Literal)
import Syntax.Position

data Keyword
	= KwLet | KwIn | KwWhere
	| KwPostulate | KwOpen | KwModule | KwData
	| KwInfix | KwInfixL | KwInfixR
	| KwMutual | KwAbstract | KwPrivate
	| KwSet | KwProp
    deriving (Eq, Show)

layoutKeywords :: [Keyword]
layoutKeywords = [ KwLet, KwWhere, KwPostulate, KwMutual, KwAbstract ]

data Symbol
	= SymDot | SymComma | SymSemi | SymVirtualSemi
	| SymBackQuote  | SymColon | SymArrow | SymEqual | SymLambda
	| SymUnderscore	| SymQuestionMark
	| SymOpenParen	      | SymCloseParen
	| SymOpenBrace	      | SymCloseBrace
	| SymOpenBracket      | SymCloseBracket
	| SymOpenVirtualBrace | SymCloseVirtualBrace
    deriving (Eq, Show)

data Token
	  -- Keywords
	= TokKeyword Keyword Range
	  -- Identifiers and operators
	| TokId		Name
	| TokOp		Name
	| TokQId	QName	-- non empty namespace
	| TokQOp	QName	-- non empty namespace
	  -- Literals
	| TokLiteral	Literal
	  -- Special symbols
	| TokSymbol Symbol Range
	  -- Other tokens
	| TokSetN (Range, Int)
	| TokTeX String
	| TokEOF
    deriving (Eq, Show)

