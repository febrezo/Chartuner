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

namespace AppWidgets {
    public class MainView : Gtk.Frame {
        private string source_text;
        private Gtk.TextView text_view;
        private Gtk.Button original_btn;
        private Gtk.Button bold_btn;
        private Gtk.Button italic_btn;
        
        construct {
            var label = new Gtk.Label (_("Type the text to transform"));
            label.get_style_context ().add_class (Granite.STYLE_CLASS_H1_LABEL);

            // Se tthe text view
            // -----------------            
            this.text_view = new Gtk.TextView ();
            this.text_view.set_wrap_mode (Gtk.WrapMode.WORD);
            this.text_view.monospace = true;
            this.text_view.editable = true;
            this.text_view.cursor_visible = true;
            this.text_view.buffer.changed.connect (text_changed);
            
		    var scrolled_window = new Gtk.ScrolledWindow (null, null);
		    scrolled_window.set_policy (
		        Gtk.PolicyType.AUTOMATIC,
		        Gtk.PolicyType.AUTOMATIC
	        );

		    scrolled_window.add (this.text_view);
		    scrolled_window.set_border_width (5);

            // Set the actions bar
            // -------------------------
            this.original_btn = new Gtk.Button.from_icon_name ("format-text-none", Gtk.IconSize.LARGE_TOOLBAR);
            this.original_btn.clicked.connect (transform_to_original);
            this.original_btn.sensitive = false;
            this.original_btn.tooltip_text = _("Recover original format");

            this.bold_btn = new Gtk.Button.from_icon_name ("format-text-bold", Gtk.IconSize.LARGE_TOOLBAR);
            this.bold_btn.clicked.connect (transform_to_bold);
            this.bold_btn.sensitive = false;
            this.bold_btn.tooltip_text = _("Transform characters to bold");
            
            this.italic_btn = new Gtk.Button.from_icon_name ("format-text-italic", Gtk.IconSize.LARGE_TOOLBAR);
            this.italic_btn.clicked.connect (transform_to_italic);
            this.italic_btn.sensitive = false;
            this.italic_btn.tooltip_text = _("Transform characters to italic");
            
            var grid_actions = new Gtk.Grid();            
            grid_actions.column_homogeneous = true;
            grid_actions.expand = false;
            grid_actions.valign = Gtk.Align.CENTER;
            grid_actions.attach (new Gtk.Label(""), 0, 0);
            grid_actions.attach (this.original_btn, 1, 0, 1);
            grid_actions.attach (new Gtk.Label(""), 2, 0);
            grid_actions.attach (this.bold_btn, 3, 0, 1);
            grid_actions.attach (this.italic_btn, 4, 0, 1);
            grid_actions.attach (new Gtk.Label(""), 5, 0);

            // Packing elements
            var stack_grid = new Gtk.Grid ();
            stack_grid.margin_top = 12;
            stack_grid.margin_bottom = 12;
            stack_grid.column_spacing = 12;
            stack_grid.row_spacing = 12;
            stack_grid.halign = Gtk.Align.CENTER;
            stack_grid.valign = Gtk.Align.CENTER;
            stack_grid.attach (label, 0, 0);
            stack_grid.attach (scrolled_window, 0, 1, 1, 50);
            stack_grid.attach (grid_actions, 0, 51);

            this.add (stack_grid);
            this.show_all ();
        }

        private void text_changed () {
            this.bold_btn.sensitive = true;
            this.italic_btn.sensitive = true;
        }
        
        private void transform_to_original () {
            this.original_btn.sensitive = false;
            this.text_view.sensitive = true;
        }

        private void transform_to_bold () {
            this.text_view.sensitive = false;
            this.original_btn.sensitive = true;
        }
                
        private void transform_to_italic () {
            this.text_view.sensitive = false;
            this.original_btn.sensitive = true;
        }
    }
}
