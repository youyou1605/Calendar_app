// app/javascript/calendar.js
import { Calendar } from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import interactionPlugin from "@fullcalendar/interaction";

document.addEventListener("DOMContentLoaded", function () {
  const calendarEl = document.getElementById("calendar");

  const calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin, interactionPlugin],
    initialView: "dayGridMonth",
    events: "/events.json",
    eventClick: function (info) {
      window.location.href = "/events/" + info.event.start.toISOString().slice(0, 10);
    },
    eventContent: function (info) {
      const event = info.event;
      let content = event.title;

      if (event.start < info.date && info.date < event.end) {
        content = "続き: " + content;
      }

      return { html: content };
    },
  });

  calendar.render();
});
