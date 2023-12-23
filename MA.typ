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
    if i == 1 {
      return
    }
    else{
      set align(right)
      image("images/HTWD_Logo.png",width:20%)
      let elems = query(selector(heading.where(level: 1).before(loc)),loc)
      set align(left)
      set text(size: 10pt)
      line(start: (0pt,0pt), length: 100%)
      }
    },
  ),
  footer: locate(loc => {
    let i = counter(page).at(loc).first()
    if i == 1 {
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
      counter(page).display()
    }
  })
)

#set text(
  font: "Times New Roman",
  size: 12pt
)

#set heading(
  numbering: "1.",
)
#show heading.where(level: 1): set text(size:16pt,weight:"bold")
#show heading.where(level: 2): set text(size:14pt,weight:"bold")
#show heading.where(level: 3): set text(size:12pt,weight:"bold")
#show heading.where(level: 4): set text(size:12pt,weight:"thin", style: "italic")
#show heading.where(level: 5): set text(size:12pt,weight:"bold")

#align(center)[
  Hochschule für Technik und Wirtschaft Dresden
  #v(20pt)
  Fakultät Informatik / Mathematik
  #v(35pt)
  #image("images/HTWD_Logo.png",width:50%)
  #v(35pt)
  #text(size: 30pt,weight:"bold")[Masterarbeit]
  #v(20pt)
  im Studiengang Angewandte Informatik
  #v(40pt)
  Thema: Nutzung generativer künstlicher Intelligenz zur Verbesserung der Barrierefreiheit im e-Commerce
  #v(30pt)
  eingereicht von: Paul Willam
  #v(30pt)
  eingereicht am: XXXX
  #v(30pt)
  Betreuer: Prof. Dr.-Ing. Maik Thiele  
]
#pagebreak()
#heading(level: 1, numbering: none, outlined: false)[
  Inhaltsverzeichnis
]
#outline(title: "")
#pagebreak()

#heading(level: 1, numbering: none, outlined: false)[
  Abbildungsverzeichnis 
]
  #outline(title: "", target: {figure.where(kind: image)})
  #pagebreak()
= B
#figure(
  image("images/test.PNG"),
  caption: "test",
  supplement: "Abbildung"
)