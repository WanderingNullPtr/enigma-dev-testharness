/** Copyright (C) 2020 Josh Ventura
***
*** This file is a part of the ENIGMA Development Environment.
***
*** ENIGMA is free software: you can redistribute it and/or modify it under the
*** terms of the GNU General Public License as published by the Free Software
*** Foundation, version 3 of the license or any later version.
***
*** This application and its source code is distributed AS-IS, WITHOUT ANY
*** WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
*** FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
*** details.
***
*** You should have received a copy of the GNU General Public License along
*** with this code. If not, see <http://www.gnu.org/licenses/>
**/

#include "tokens.h"

#include <iostream>
#include <string>
#include <sstream>
#include <vector>

namespace enigma {
namespace parsing {
namespace {

using std::string;

static const std::vector<std::string> kTokenNames = [](){
  std::vector<std::string> res;
  res.resize(TT_ENDOFCODE + 1);
  #define REGISTER(name) [[fallthrough]]; case name: res[name] = #name
  switch (TT_ENDOFCODE) {
    default:
    REGISTER(TT_ENDOFCODE);
    REGISTER(TT_ERROR);
    REGISTER(TTM_WHITESPACE);
    REGISTER(TT_VARNAME);
    REGISTER(TT_SEMICOLON);
    REGISTER(TT_COLON);
    REGISTER(TT_COMMA);
    REGISTER(TT_ASSOP);
    REGISTER(TT_DECIMAL);
    REGISTER(TT_PLUS);
    REGISTER(TT_MINUS);
    REGISTER(TT_INCREMENT);
    REGISTER(TT_DECREMENT);
    REGISTER(TT_STAR);
    REGISTER(TT_SLASH);
    REGISTER(TT_LESS);
    REGISTER(TT_GREATER);
    REGISTER(TT_LESSEQUAL);
    REGISTER(TT_GREATEREQUAL);
    REGISTER(TT_NOTEQUAL);
    REGISTER(TT_LSH);
    REGISTER(TT_RSH);
    REGISTER(TT_QMARK);
    REGISTER(TT_BEGINPARENTH);
    REGISTER(TT_ENDPARENTH);
    REGISTER(TT_BEGINBRACKET);
    REGISTER(TT_ENDBRACKET);
    REGISTER(TT_BEGINBRACE);
    REGISTER(TT_ENDBRACE);
    REGISTER(TT_BEGINTRIANGLE);
    REGISTER(TT_ENDTRIANGLE);
    REGISTER(TT_DECLITERAL);
    REGISTER(TT_BINLITERAL);
    REGISTER(TT_OCTLITERAL);
    REGISTER(TT_HEXLITERAL);
    REGISTER(TT_STRING);
    REGISTER(TT_SCOPEACCESS);
    REGISTER(TT_FUNCTION);
    REGISTER(TT_TYPE_NAME);
    REGISTER(TT_NAMESPACE);
    REGISTER(TT_LOCGLOBAL);
    REGISTER(TT_SHORTSTATEMENT);
    REGISTER(TT_TINYSTATEMENT);
    REGISTER(TT_S_SWITCH);
    REGISTER(TT_S_CASE);
    REGISTER(TT_S_DEFAULT);
    REGISTER(TT_S_FOR);
    REGISTER(TT_S_IF);
    REGISTER(TT_S_ELSE);
    REGISTER(TT_S_DO);
    REGISTER(TT_S_WHILE);
    REGISTER(TT_S_UNTIL);
    REGISTER(TT_S_WITH);
    REGISTER(TT_S_TRY);
    REGISTER(TT_S_CATCH);
    REGISTER(TT_S_NEW);
  }
  return res;
}();

}  // namespace

std::string ToString(TokenType tt) {
  return kTokenNames[tt];
}
string Token::ToString() const {
  std::stringstream str;
  str << kTokenNames[type] << "(\"" << content << "\")";
  return str.str();
}

std::ostream &operator<<(std::ostream &os, TokenType tt) {
  return os << kTokenNames[tt];
}
std::ostream &operator<<(std::ostream &os, const Token &t) {
  return os << t.ToString();
}

}  // namespace parsing
}  // namespace enigma
