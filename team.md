---
title: Team
layout: default
permalink: /team/
description: The PMC, committers, and contributors behind Apache Storm.
---

<div class="team-page">

<p class="team-intro">
  Apache Storm is developed and maintained by a community of volunteers from
  around the world. Below are the project's active and emeritus PMC members
  and committers, sourced from
  <a href="https://whimsy.apache.org/roster/committee/storm">the official ASF roster</a>
  and overlaid with the project's currently active set.
</p>

<section class="team-section">
  <h2 id="active">Active team</h2>
  {% if site.data.team_active and site.data.team_active.size > 0 %}
  <ul class="team-grid">
    {% for m in site.data.team_active %}
    <li class="team-card team-card--active">
      <div class="team-avatar" aria-hidden="true">{{ m.name | slice: 0, 1 | upcase }}</div>
      <div class="team-meta">
        <p class="team-name">{{ m.name }}</p>
        <p class="team-roles">
          {% if m.role == 'chair' %}<span class="role-badge role-chair" title="PMC Chair">Chair</span>{% endif %}
          {% if m.role == 'pmc' or m.role == 'chair' %}<span class="role-badge role-pmc" title="PMC member">PMC</span>{% endif %}
          <span class="role-badge role-committer" title="Committer">Committer</span>
        </p>
        <p class="team-links">
          <a href="https://github.com/{{ m.github }}" rel="noopener" target="_blank">@{{ m.github }}</a>
          <span class="team-availid">·&nbsp;{{ m.apache_id }}@apache.org</span>
        </p>
      </div>
    </li>
    {% endfor %}
  </ul>
  {% else %}
  <p class="team-empty">Active team list is currently unavailable.</p>
  {% endif %}
</section>

{% if site.data.team_emeritus and site.data.team_emeritus.size > 0 %}
<section class="team-section">
  <h2 id="emeritus">Emeritus</h2>
  <p class="team-emeritus-intro">
    Past contributors who served as Storm PMC members or committers and are
    no longer actively maintaining the project. Many of them shaped Storm
    into what it is today &mdash; thank you.
  </p>
  <ul class="team-emeritus-list">
    {% for m in site.data.team_emeritus %}
    <li>
      <a href="https://github.com/{{ m.github }}" rel="noopener" target="_blank">{{ m.name }}</a>
      {% if m.role == 'pmc' %}<span class="role-badge role-pmc role-badge--sm">PMC</span>{% endif %}
      <span class="team-availid">({{ m.apache_id }})</span>
    </li>
    {% endfor %}
  </ul>
</section>
{% endif %}

<section class="team-section">
  <h2 id="contributors">Wall of fame</h2>
  <p>
    Apache Storm exists because of the many people who have contributed code,
    reviews, documentation, and bug reports across the project's repositories
    on GitHub. The full list is far too long to render here &mdash; please
    have a look at the
    <a href="https://github.com/apache/storm/graphs/contributors" rel="noopener" target="_blank">contributors graph on GitHub</a>
    to see them all.
  </p>
  <p class="team-thanks">
    <strong>Thank you to every contributor</strong> &mdash; your patches,
    reports, and reviews are what keep Storm moving.
  </p>
  <p>
    If you would like to contribute, see the
    <a href="/contribute/Contributing-to-Storm.html">contributing guide</a>
    and join the conversation on the
    <a href="/getting-help.html">developer mailing list</a>.
  </p>
</section>

</div>
