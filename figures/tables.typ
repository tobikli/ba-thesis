#let functional-tests-table = table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) =>
    if y == 0 { gray }
    else { silver },
  align: (x, y) =>
    if x == 2 { center}
    else { left },
  inset: (right: 1.5em),
  columns: 3,
  [Name], [Assertions], [Status],
  [Create file], [Assert if file appears in the file tree], [#text(green)[✓]],
  [Create file with content], [Assert if content is displayed in the editor], [#text(green)[✓]],
  [Undo and Redo], [Assert if content is restored after undo and redo], [#text(green)[✓]],
  [Delete file], [Assert if file is deleted from the file tree], [#text(green)[✓]],
  [Create file in folder], [Assert if file and folder appears in the file tree], [#text(green)[✓]],
  [], [], [],
  [], [], [],
  [], [], [],
  [], [], [],
)

#let programming-tests-table = table(
  stroke: none,
  gutter: 0.2em,
  fill: (x, y) =>
    if y == 0 { gray }
    else { silver },
  inset: (right: 1.5em),
  columns: 3,
  [Name], [Assertions], [Status],
  [Syntax highlighting], [Assert if file appears in the file tree], [],
  [Build with correct syntax], [Assert if content is displayed in the editor], [],
  [Build with wrong syntax], [Assert if content is restored after undo and redo], [],
  [Run and compile successful], [Assert if file is deleted from the file tree], [],
  [Run and compile unsuccessful], [Assert if file and folder appears in the file tree], [],
)

// Preview
#heading([Functional Tests])
#functional-tests-table
#heading([Programming Tests])
#programming-tests-table