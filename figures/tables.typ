#let functional-tests-table = table( 
  columns: (1fr), align: left, 
  [*Editor Tests*],
  [Create new File],
  [Create File with content],
  [Undo and Redo text in file],
  [Delete file],
  [Create new File in folder],
  [Test copy from String],
  [*Search Tests*],
  [Search for text in the editor],
  [Search for text using menu bar],
  [Search for text using sidebar],
  [Search for text using sidebar multiple files],
  [*Terminal Tests*],
  [Open Terminal],
  [Terminal command: ls],
  [Terminal command: touch],
  [Terminal command: rm],
  [Terminal multiple tabs],
  [*Version Control Tests*],
  [Commit],
  [Push]
)

#let programming-tests-table = table( 
  columns: (1fr), align: left, 
  [*C App Image*],
  [C modules installed],
  [Create C file],
  [Compile C file],
  [Run C file],
  [*Java App Image*],
  [Java modules installed],
  [Create Java file],
  [Compile Java file],
  [Run Java file],
  [*JavaScript App Image*],
  [JavaScript modules installed],
  [Create JavaScript file],
  [Run JavaScript file],
  [*Ocaml App Image*],
  [Ocaml modules installed],
  [Create Ocaml file],
  [Compile Ocaml file],
  [Run Ocaml file],
  [*Python App Image*], 
  [Python modules installed],
  [Create Python file],
  [Compile Python file],
  [Run Python file],
  [*Rust App Image*],
  [Rust modules installed],
  [Create Rust file],
  [Run Rust file],
  [Compile Rust file],
  [Run Rust file]
)

#let programming-tests-table = table( 
  columns: (1fr), align: left, 
  [*C App Image*],
  [C modules installed],
  [Create C file],
  [Compile C file],
  [Run C file],
  [*Java App Image*],
  [Java modules installed],
  [Create Java file],
  [Compile Java file],
  [Run Java file],
  [*JavaScript App Image*],
  [JavaScript modules installed],
  [Create JavaScript file],
  [Run JavaScript file],
  [*Ocaml App Image*],
  [Ocaml modules installed],
  [Create Ocaml file],
  [Compile Ocaml file],
  [Run Ocaml file],
  [*Python App Image*], 
  [Python modules installed],
  [Create Python file],
  [Compile Python file],
  [Run Python file],
  [*Rust App Image*],
  [Rust modules installed],
  [Create Rust file],
  [Run Rust file],
  [Compile Rust file],
  [Run Rust file]
)

#let landingpage-tests-table = table( 
  columns: (1fr), align: left, 
  [*Landing Page Tests (unauthenticated)*],
  [Login button should be visible],
  [Login should redirect to Keycloak],
  [Login via the UI],
  [*Landing Page Tests (authenticated)*],
  [User should be logged in],
  [Programming language instances should be visible],
  [Launch C instance],
)

#let artemis-tests-table = table( 
  columns: (1fr), align: left, 
  [*Artemis Integration Tests*],
  [Theia IDE loads from Artemis],
  [Creation of course and exercise is possible],
  [Repository is cloned],
  [Student submits code],
  [check result on Artemis]
)

#let scaling-tests-table = table( 
  columns: (1fr), align: left, 
  [*Load Tests Scenarios*],
  [editBubbleSort],
  [editMergeSort],
  [editClient],
  [editContext],
  [editPolicy],
  [editSortStrategy],
  [commit],
  [createNewRandomFile],
  [createAndEditRandomFile],
  [useTerminal],
  [runTests],
  [searchForWords],
  [changePreferences],
  [openAboutPage],
  [reloadPage],
  [buildAndRun]
)

#let status-table = table( 
  columns: 2, align: left, 
  [*Status*], [],
  [*FR1* Simulate User Interactions], [●],
  [*FR2* Automated End-to-End Testing], [●],
  [*FR3* Load and Performance Testing], [●],
  [*FR4* Monitoring and Reporting], [◐],
  [*FR5* Scenario Management], [●],
  [*FR6* Integration with Intelligent Agents], [◐],
)


// Preview
#heading([Functional Tests])
#functional-tests-table
#heading([Programming Tests])
#programming-tests-table
#heading([Landing Page Tests])
#landingpage-tests-table
#heading([Artemis Integration Tests])
#artemis-tests-table
#heading([Load Tests Scenarios])
#scaling-tests-table
#heading([Status])
#status-table