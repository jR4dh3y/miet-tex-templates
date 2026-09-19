// ============================================================================
//  MIET Project Synopsis Template
//  Model Institute of Engineering and Technology (Autonomous), Jammu
//  Department of Computer Science and Engineering
// ============================================================================
//  Faithful recreation ("bar for bar") of the official MIET Synopsis Format.
//  Compile with: typst compile template.typ
// ============================================================================

// ----------------------------------------------------------------------------
//  USER-CONFIGURABLE PARAMETERS
// ----------------------------------------------------------------------------

#let project-title = "TITLE OF THE PROJECT"

// Subtitle/instruction placeholder from the format document.
// Set to none or "" when finalizing your project synopsis.
#let title-instruction = "(FONT: TIMES NEW ROMAN, FONT SIZE: 18)"

#let degree = "BACHELOR OF TECHNOLOGY"
#let degree-preposition = "In"
#let department-short = "COMPUTER SCIENCE AND ENGINEERING"

// Candidate names and roll numbers.
// Default uses the format placeholder. Replace with your group members.
// Example for multiple candidates:
// #let candidates = (
//   (name: "Student Name 1", roll: "XXXX"),
//   (name: "Student Name 2", roll: "YYYY"),
//   (name: "Student Name 3", roll: "ZZZZ"),
// )
#let candidates = (
  (name: "Name of the Candidate(s) (14)", roll: "(14)"),
)

#let department-full = "Department of Computer Science and Engineering"
#let institute = "Model Institute of Engineering and Technology (Autonomous)"
#let location = "Jammu, India"
#let year = "2026"
#let logo-path = "logo.png"

// Paper size: "a4" (standard for Indian universities) or "us-letter" (Word default)
#let paper-size = "a4"

// Set to true to automatically compute section page numbers in the Table of Contents,
// or false to leave blank as in the blank submission format.
#let auto-page-numbers = true

// Font choice: "Liberation Serif" is the exact metric-compatible equivalent of
// Times New Roman on Linux. Both are listed in the fallback chain.
#let serif-font = ("Times New Roman", "Liberation Serif")

// ----------------------------------------------------------------------------
//  DOCUMENT SETUP & STYLING
// ----------------------------------------------------------------------------

#set page(
  paper: paper-size,
  margin: (top: 1in, bottom: 1in, left: 1.5in, right: 1in),
  header: none,
  footer: context {
    let p = counter(page).get().first()
    // Suppress footer on cover page
    if p > 1 {
      align(center, text(font: serif-font, size: 12pt, str(p)))
    }
  },
)

#set text(
  font: serif-font,
  size: 14pt,
  lang: "en",
)

#set par(
  justify: true,
  leading: 0.65em,
  spacing: 0.9em,
)

#set list(
  marker: [•],
  spacing: 0.7em,
  body-indent: 0.5em,
)

// Helper to query page number of a labelled section
#let get-page(target-label) = context {
  if auto-page-numbers {
    let elems = query(target-label)
    if elems.len() > 0 {
      str(elems.first().location().page())
    } else {
      ""
    }
  } else {
    ""
  }
}

// Custom heading styling
#show heading.where(level: 1): it => block(
  above: 1.3em,
  below: 0.8em,
  text(size: 14pt, weight: "bold", it.body)
)

#show heading.where(level: 2): it => block(
  above: 1.1em,
  below: 0.6em,
  text(size: 14pt, weight: "bold", it.body)
)

// ============================================================================
//  COVER / TITLE PAGE
// ============================================================================

#align(center)[
  #v(0.3cm)

  #text(size: 18pt, weight: "bold")[#project-title]

  #if title-instruction != none and title-instruction != "" [
    #v(0.2cm)
    #text(size: 18pt, weight: "bold")[#title-instruction]
  ]

  #v(1.1cm)

  #text(size: 12pt, weight: "bold")[
    A MINI PROJECT SYNOPSIS SUBMITTED\
    IN PARTIAL FULFILLMENT OF THE REQUIREMENTS\
    FOR THE AWARD OF DEGREE OF
  ]

  #v(1.0cm)

  #text(size: 14pt, weight: "bold")[
    #degree\
    #degree-preposition\
    #department-short
  ]

  #v(1.0cm)

  #text(size: 14pt, weight: "bold")[SUBMITTED BY]

  #v(0.3cm)

  #if candidates.len() == 1 and candidates.first().name.contains("Candidate(s)") [
    #text(size: 14pt)[#candidates.first().name]\
    #text(size: 14pt)[Roll Number(s): #candidates.first().roll]
  ] else [
    #for cand in candidates [
      #text(size: 14pt)[#cand.name #if cand.roll != "" [(Roll Number: #cand.roll)]]\
    ]
  ]

  #v(1.0cm)

  #image(logo-path, width: 12.6cm)

  #v(1.0cm)

  #text(size: 14pt, weight: "bold")[SUBMITTED TO]

  #v(0.3cm)

  #text(size: 16pt)[
    #department-full\
    #institute\
    #location\
    #year
  ]
]

#pagebreak()

// ============================================================================
//  TABLE OF CONTENTS: CONTENTS OF SYNOPSIS
// ============================================================================

#align(center)[
  #text(size: 20pt, weight: "bold")[CONTENTS OF SYNOPSIS]
]

#v(1.2cm)

#align(center)[
  #table(
    columns: (2.0cm, 1fr, 2.8cm),
    stroke: 0.5pt + black,
    inset: (x: 10pt, y: 9pt),
    align: (center + horizon, left + horizon, center + horizon),
    table.header(
      [*#text(size: 16pt)[S. No]*],
      [*#text(size: 16pt)[Topic]*],
      [*#text(size: 16pt)[Page No]*],
    ),
    [#text(size: 16pt, weight: "bold")[1.]], [*#text(size: 16pt)[Project Overview]*], text(size: 16pt)[#get-page(<sec:overview>)],
    [#text(size: 16pt, weight: "bold")[2.]], [*#text(size: 16pt)[Problem Statement]*], text(size: 16pt)[#get-page(<sec:problem>)],
    [#text(size: 16pt, weight: "bold")[3.]], [*#text(size: 16pt)[Objectives of the Project]*], text(size: 16pt)[#get-page(<sec:objectives>)],
    [#text(size: 16pt, weight: "bold")[4.]], [*#text(size: 16pt)[Proposed Solution / Methodology]*], text(size: 16pt)[#get-page(<sec:solution>)],
    [#text(size: 16pt, weight: "bold")[5.]], [*#text(size: 16pt)[Key Technologies and Tools]*], text(size: 16pt)[#get-page(<sec:technologies>)],
    [#text(size: 16pt, weight: "bold")[6.]], [*#text(size: 16pt)[V.E.T.S Justification]*], text(size: 16pt)[#get-page(<sec:vets>)],
    [#text(size: 16pt, weight: "bold")[7.]], [*#text(size: 16pt)[Expected Outcomes]*], text(size: 16pt)[#get-page(<sec:outcomes>)],
    [#text(size: 16pt, weight: "bold")[8.]], [*#text(size: 16pt)[Implementation Timeline]*], text(size: 16pt)[#get-page(<sec:timeline>)],
    [#text(size: 16pt, weight: "bold")[9.]], [*#text(size: 16pt)[References]*], text(size: 16pt)[#get-page(<sec:references>)],
  )
]

#pagebreak()

// ============================================================================
//  INSTRUCTIONS & SECTION CONTENT (BAR FOR BAR)
// ============================================================================

#heading(level: 1, numbering: none)[Instructions for Preparing Major Project Synopsis]

The synopsis should clearly explain the *idea, problem, engineering approach, and feasibility of the project*. Students should focus on *clarity and justification*, not lengthy theoretical explanations.

Each section should address the following expectations.

#v(0.4em)

= 1. Project Overview <sec:overview>

This section provides a *brief introduction to the project idea*.

Students should explain:
- What the project is about in simple terms.
- The *domain or area* the project belongs to (AI, Cybersecurity, IoT, Cloud Computing, Blockchain, etc.).
- Why the problem area is relevant today.
- The *target users or environment* where the solution will be used.

Guidelines:
- Keep the description concise and clear.
- Avoid long background discussions.
- Limit this section to *5–6 lines or one short paragraph*.

#v(0.4em)

= 2. Problem Statement <sec:problem>

This section must clearly define *the specific problem the project is trying to solve*.

Students should describe:
- The *existing issue or limitation* in current systems or processes.
- Why the problem matters.
- Who is affected by the problem.
- What gap currently exists in existing solutions.

Guidelines:
- The problem must be *clear, specific, and measurable*.
- Avoid vague statements such as "there is a need for a system".
- Write the problem in *5–7 clear sentences*.

#v(0.4em)

= 3. Objectives of the Project <sec:objectives>

This section defines *what the project intends to achieve*.

Students should list *3–5 clear objectives* describing the goals of the system.

Each objective should:
- Begin with an action verb such as Design, Develop, Implement, Evaluate, Analyze.
- Focus on *technical outcomes* rather than general statements.

Examples:
- Develop a system that detects fraudulent transactions using machine learning.
- Design a web-based platform for automated appointment scheduling.
- Implement a secure authentication system using multi-factor authentication.

Guidelines:
- Objectives must be *specific and achievable within the project duration*.
- Avoid overly ambitious goals.

#v(0.4em)

= 4. Proposed Solution / Methodology <sec:solution>

This section explains *how the problem will be solved*.

Students should describe:
- The *overall approach or idea* of the solution.
- The *major components or modules* of the system.
- How these components interact to solve the problem.

Students may include:
- A simple *system architecture diagram*
- A *workflow diagram*
- A brief explanation of the system modules

Guidelines:
- Focus on *technical approach*, not theoretical background.
- Explain the *main modules or stages* of the system.
- Avoid unnecessary implementation details.

#v(0.4em)

= 5. Key Technologies and Tools <sec:technologies>

This section lists the *technologies that will be used to implement the project*.

Students should mention:
- Programming languages
- Frameworks or libraries
- Databases
- Development platforms
- Hardware or devices (if applicable)

Examples:
- Python, TensorFlow, Scikit-Learn
- Node.js, React, MongoDB
- Docker, Kubernetes
- Arduino, Raspberry Pi

Guidelines:
- Mention *only core technologies*.
- Avoid listing too many tools unnecessarily.

#v(0.4em)

= 6. V.E.T.S Justification <sec:vets>

Students must justify their project idea using the *V.E.T.S Framework* introduced during the project orientation.

== V - Viability

Students must explain:
- Whether the project is *feasible within the available time and resources*.
- Availability of *datasets, APIs, hardware, or tools* needed for development.
- Whether the team has the *required technical skills*.

== E - Engineering Depth

Students must demonstrate that the project includes *substantial engineering work*.

Examples include:
- Algorithm development
- Machine learning model implementation
- Security mechanisms
- Optimization techniques
- System integration
- Distributed or cloud architecture

Projects that involve *only basic UI development or simple CRUD operations* will not be considered sufficient.

== T - Trend Alignment

Students must explain how their project aligns with *current technological trends*, such as:
- Artificial Intelligence / Machine Learning
- Cybersecurity
- Edge Computing
- Cloud-native systems
- Internet of Things
- Blockchain
- Data Analytics
- Automation

Explain *why the selected trend is relevant to the problem being solved*.

== S - Social / Industrial Impact

Students must describe the *potential impact of the project*.

Possible considerations include:
- Benefits to society
- Improvements in efficiency or automation
- Cost reduction
- Safety enhancement
- Industry relevance
- Contribution to digital transformation

#v(0.4em)

= 7. Expected Outcomes <sec:outcomes>

This section describes *what the project will deliver at the end of development*.

Students should list:
- The final system or prototype that will be developed
- Key features of the system
- Any models, algorithms, or tools created
- Possible deployment or demonstration setup

#v(0.4em)

= 8. Implementation Timeline <sec:timeline>

Students should provide a *simple project development schedule*.

The timeline should divide the project into *major phases*, such as:

#v(0.4em)

#align(center)[
  #table(
    columns: (3.5cm, 1fr),
    stroke: 0.5pt + black,
    inset: (x: 10pt, y: 7pt),
    align: (center + horizon, left + horizon),
    table.header(
      [*Phase*], [*Activity*]
    ),
    [*Phase 1*], [Problem analysis and requirement study],
    [*Phase 2*], [System design and architecture],
    [*Phase 3*], [Implementation and module development],
    [*Phase 4*], [Testing and evaluation],
    [*Phase 5*], [Documentation and final presentation],
  )
]

Guidelines:
- The timeline should reflect *realistic progress milestones*.
- Avoid overly complex scheduling details.

#v(0.4em)

= 9. References <sec:references>

Students should include *relevant technical references* that helped them understand the problem or design the solution.

References may include:
- Research papers
- Technical articles
- Books
- Official documentation
- Credible websites

Guidelines:
- Include *at least 8-10 references*.
- Prefer *recent and reliable sources*.
