// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import $ from 'jquery';
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import 'calendar'; // ここにカレンダー機能を実装したファイル名を記述します
import './calendar';
import '../calendar';

Rails.start()
Turbolinks.start()
ActiveStorage.start()
