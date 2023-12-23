#let header_heading(loc) = {
  //get all headings
  let headings = query(heading.where(level:1),loc)
  //look for first level 1 heading on page 
  let first_heading = headings.find(h => h.location().page() == loc.page())
  //look for last level 1 heading before this one
  let last_heading = query(heading.where(level:1).before(loc),loc)
  if not first_heading == none {
    return first_heading.body
  }
  else{
    //weird behavior on outline -> empty last heading
    if(loc.page() == 3){
    return last_heading.first().body}
    else{
      last_heading.last().body
    }
  }
}

#counter(page).update(0)
#set page(
  paper: "a4",
  margin: (
    top: 3cm,
    bottom: 3cm,
    left: 4cm,
    right: 2cm
  ),
  numbering: "1",
  number-align: right,
  header: locate(loc => {
    let i = counter(page).at(loc).first()
    if i == 0 {
      return
    }
    else{
      set align(left)
      set text(size: 10pt)
      let heading = header_heading(loc)
      place(
        top + left,
        heading,
        dy: 80%,
      )
      place(
        top + right,
        image("images/HTWD_Logo.png",width:20%),
        dy: 50%
      )
      line(start: (0pt,0pt), length: 100%)
      }
    },
  ),
  footer: locate(loc => {
    let i = counter(page).at(loc).first()
    if i == 0 {
      return
    }
    else{
      line(
        start: (0pt,0pt),
        length: 100%)
      set align(left)
      set text(10pt)
      set align(right)
      set text(12pt)
      counter(page).display(loc.page-numbering())
    }
  })
)

#set text(
  font: "Times New Roman",
  size: 12pt,

)

#show par: p => [
  #set par(leading: 1.5em)
  #text(p)
  #v(1em)
]

#show outline.entry: o => [
  #strong(o.body)
  #box(height: 1%,width: 1fr, repeat("."))
  #strong(o.page)
]

#show heading: h => [
  #set block(below: 1em)
  #h
]

#set heading(numbering: "1.")
#show heading.where(level: 1): set text(size:16pt,weight:"bold")
#show heading.where(level: 2): set text(size:14pt,weight:"bold")
#show heading.where(level: 3): set text(size:12pt,weight:"bold")
#show heading.where(level: 4): set text(size:12pt,weight:"thin", style: "italic")
#show heading.where(level: 5): set text(size:12pt,weight:"bold")

#set cite(
  style: "chicago-author-date"
)

#set bibliography(
  
)

#let ccite(k) = {
  upper(cite(label(k)))
}

#align(center)[
  Hochschule für Technik und Wirtschaft Dresden
  #v(20pt)
  Fakultät XXXX
  #v(35pt)
  #image("images/HTWD_Logo.png",width:50%)
  #v(35pt)
  #text(size: 30pt,weight:"bold")[Masterarbeit]
  #v(20pt)
  im Studiengang XXXX 
  #v(40pt)
  Thema: XXXX
  #v(30pt)
  eingereicht von: XXXX
  #v(30pt)
  eingereicht am: XXXX
  #v(30pt)
  Betreuer:  XXXXX 
]
#pagebreak()
#set page(numbering: "I")
#heading(level: 1, numbering: none, outlined: false)[
  Inhaltsverzeichnis
]
#outline(title: "", indent: auto)
#pagebreak()

#heading(level: 1, numbering: none, outlined: false)[
  Abbildungsverzeichnis 
]
  #outline(title: "", target: {figure.where(kind: image)})
  #pagebreak()

#set page(numbering: "1")
#counter(page).update(1)

= Einleitung
#figure(
  image("images/HTWD_Logo.png"),
  caption: "test",
  supplement: "Abbildung"
)

#pagebreak()

Lorem Ipsum #ccite("harry")

#ccite("harry2")

#pagebreak()
= Quellenverzeichnis

#bibliography("bib/sources.yml", title: none, full: false, style: "chicago-author-date",)

#pagebreak()
= Anhang

Lorem Ipsum