import flatpickr from "flatpickr";

const initFlatpickr = () => {
  flatpickr(".datepicker", { dateFormat: "M d"});
}

export { initFlatpickr };
