---
layout: page
title: About
permalink: /about/
---
The Friday Fish is a weekly seminar on differential geometry that has been taking place in Utrecht since 2004. It started as an activity for researchers, PhD candidates, and visitors in the field of Poisson geometry (partially explaining the name). One of its core aims from the outset was to provide a platform for young mathematicians to present their research, learn new ideas, and to broaden their network. Whereas our goals regarding young researchers have remained the same over time, the focus on Poisson geometry has progressively broadened to include the study of other geometric structures. At the moment, the seminar deals with differential geometry and topology in general.

# Practical information
We regularly livestream and record the seminar. The link for the livestream is announced through our mailing list, and the links to the recordings appear on this website alongside the information of the talk.

- *When and where*: Talks will be held on Friday; the physical location can be found on this website and in the [calendar of the institute][calendar].
- *Announcements*: Talks will be announced on this website and through our mailing list. You can sign up to our [mailing list here][mailinglist].
- *Videos and supplementary material*: If you miss or want to revisit one of the talks, you can find recordings and supplementary material on this website.

# Contact information
For inquiries you can email to `d.hoekstra [at] uu.nl`.

# Organising committee
{% assign current_organizers = site.data.organizers | where: "current", true %}
{% for member in current_organizers %}
- [{{ member.name }}]({{ member.url }})
{% endfor %}

In the past, the following people have been organizers of the Friday Fish seminar:
{% assign past_organizers = site.data.organizers | where: "current", false %}
{% for member in past_organizers %}
- [{{ member.name }}]({{ member.url }})
{% endfor %}

[calendar]: https://utrechtgeometrycentre.nl/calendar/
[mailinglist]: https://mailman.science.uu.nl/mailman/listinfo/friday-fish
