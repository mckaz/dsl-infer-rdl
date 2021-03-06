RDL.nowrap :PrettyPrint

RDL.type :PrettyPrint, 'self.format', '(?String output, ?Integer maxwidth, ?String newline) { (PrettyPrint) -> String } -> String'
RDL.type :PrettyPrint, 'self.singleline_format', '(?String output, ?Integer maxwidth, ?String newline) { (PrettyPrint) -> String } -> PrettyPrint'
RDL.type :PrettyPrint, :initialize, '(?String output, ?Integer maxwidth, ?String newline) { (PrettyPrint) -> String } -> PrettyPrint'
RDL.type :PrettyPrint, :break_outmost_groups, '() -> %bot'
RDL.type :PrettyPrint, :breakable, '(?String sep, ?Integer width) -> %bot'
RDL.type :PrettyPrint, :current_group, '() -> %any'
RDL.type :PrettyPrint, :fill_breakable, '(?String sep, ?Integer width) -> %bot'
RDL.type :PrettyPrint, :flush, '() -> %bot'
RDL.type :PrettyPrint, :group_sub, '() -> %bot'
RDL.type :PrettyPrint, :nest, '(Integer indent) { (a) -> b } -> b'
RDL.type :PrettyPrint, :text, '(String obj, ?Integer width) -> Integer'
