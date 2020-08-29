/*
* Copyright (c) 2020 Félix Brezo (https://felixbrezo.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Félix Breo <felixbrezo@disroot.orgm>
*/

using AppUtils;
using AppWidgets;

namespace Chartuner {
    public class Window : Gtk.ApplicationWindow {
        // Window elements
        private HeaderBar header_bar;
        private Granite.Widgets.Toast toast;
        private Gtk.Overlay overlay_panel;

        private MainView main_view;
        private WelcomeView welcome_view;

        // Methods
        // =======
        /// Tie to the Main Window to the Application
        public Window (Gtk.Application app) {
            Object (
              application: app
            );
        }

        construct {
            // Set Windows defaults
            // --------------------
            this.default_height = 600;
            this.default_width = 400;
            this.resizable = false;
            this.header_bar = new HeaderBar ();
            var color = Gdk.RGBA();
            color.parse("#ADAD92");
            Granite.Widgets.Utils.set_color_primary (this, color);
            this.toast = new Granite.Widgets.Toast (_("Chartuner"));

            // Define views
            // ------------
            welcome_view = new WelcomeView ();

            // Define window events
            // --------------------
            this.header_bar.settings_menu_btn.clicked.connect (on_menu_clicked);
            this.header_bar.menu.about_dialog = new AboutDialog (this);

            this.welcome_view.activated.connect ((index) => {
                switch (index) {
                    case 0:
                        this.on_new_clicked ();
                        break;
                    case 1:
                        this.on_help_clicked ();
                        break;
                    case 2:
                        this.on_code_clicked ();
                        break;
                }
            });

            // Pack things
            // -----------
            this.set_titlebar(header_bar);
            this.add (welcome_view);
        }

        // Events
        // ======
        public void on_new_clicked () {
            // Remove overlay panel and welcome view if present
            remove (overlay_panel);
            remove (welcome_view);

            main_view = new MainView (this);

            // Create overlay
            overlay_panel = new Gtk.Overlay ();
            overlay_panel.add_overlay (main_view);
            overlay_panel.add_overlay (toast);
            add (overlay_panel);

            show_all ();
        }

        private void on_help_clicked () {
            try {
                AppInfo.launch_default_for_uri (_("https://github.com/febrezo/Chartuner/master/doc/support/en/"), null);
            } catch (Error e) {
                warning (e.message);
            }
        }

        private void on_code_clicked () {
            try {
                AppInfo.launch_default_for_uri (_("https://github.com/febrezo/Chartuner"), null);
            } catch (Error e) {
                warning (e.message);
            }
        }

        private void on_menu_clicked (Gtk.Button sender) {
            this.header_bar.menu.set_relative_to (sender);
            this.header_bar.menu.show_all ();
        }
        
        public void show_toast (string message) {
            toast.title = message;
            toast.send_notification ();
        }
    }
}
