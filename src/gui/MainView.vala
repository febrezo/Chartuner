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
            stack_grid.attach (scrolled_window, 0, 1, 1, 25);
            stack_grid.attach (grid_actions, 0, 26);

            this.add (stack_grid);
            this.show_all ();
        }

        private void text_changed () {
            this.bold_btn.sensitive = true;
            this.italic_btn.sensitive = true;
            if (this.text_view.has_focus) {
                this.source_text = this.text_view.buffer.text;
            }
        }
        
        private void transform_to_original () {
            this.original_btn.sensitive = false;
            this.text_view.editable = true;
            this.text_view.buffer.text = this.source_text;
        }

        private void transform_to_bold () {
            this.original_btn.sensitive = true;
            this.text_view.editable = false;
            
            var transformed_text = "";
            
            for (int i = 0; i < this.source_text.length; i++ ) {
                string current_char = this.source_text.get_char (this.source_text.index_of_nth_char (i)).to_string ();
                switch (current_char) {
                    case "a":
                        transformed_text += "𝐚";
                        break;
                    case "b":
                        transformed_text += "𝐛";
                        break;
                    case "c":
                        transformed_text += "𝐜";
                        break;
                    case "d":
                        transformed_text += "𝐝";
                        break;
                    case "e":
                        transformed_text += "𝐞";
                        break;
                    case "f":
                        transformed_text += "𝐟";
                        break;
                    case "g":
                        transformed_text += "𝐠";
                        break;
                    case "h":
                        transformed_text += "𝐡";
                        break;
                    case "i":
                        transformed_text += "𝐢";
                        break;
                    case "j":
                        transformed_text += "𝐣";
                        break;
                    case "k":
                        transformed_text += "𝐤";
                        break;
                    case "l":
                        transformed_text += "𝐥";
                        break;
                    case "m":
                        transformed_text += "𝐦";
                        break;
                    case "n":
                        transformed_text += "𝐧";
                        break;
                    case "o":
                        transformed_text += "𝐨";
                        break;
                    case "p":
                        transformed_text += "𝐩";
                        break;
                    case "q":
                        transformed_text += "𝐪";
                        break;
                    case "r":
                        transformed_text += "𝐫";
                        break;
                    case "s":
                        transformed_text += "𝐬";
                        break;
                    case "t":
                        transformed_text += "𝐭";
                        break;
                    case "u":
                        transformed_text += "𝐮";
                        break;
                    case "v":
                        transformed_text += "𝐯";
                        break;
                    case "w":
                        transformed_text += "𝐰";
                        break;
                    case "x":
                        transformed_text += "𝐱";
                        break;
                    case "y":
                        transformed_text += "𝐲";
                        break;
                    case "z":
                        transformed_text += "𝐳";
                        break;
                    case "A":
                        transformed_text += "𝐀";
                        break;
                    case "B":
                        transformed_text += "𝐁";
                        break;
                    case "C":
                        transformed_text += "𝐂";
                        break;
                    case "D":
                        transformed_text += "𝐃";
                        break;
                    case "E":
                        transformed_text += "𝐄";
                        break;
                    case "F":
                        transformed_text += "𝐅";
                        break;
                    case "G":
                        transformed_text += "𝐆";
                        break;
                    case "H":
                        transformed_text += "𝐇";
                        break;
                    case "I":
                        transformed_text += "𝐈";
                        break;
                    case "J":
                        transformed_text += "𝐉";
                        break;
                    case "K":
                        transformed_text += "𝐊";
                        break;
                    case "L":
                        transformed_text += "𝐋";
                        break;
                    case "M":
                        transformed_text += "𝐌";
                        break;
                    case "N":
                        transformed_text += "𝐍";
                        break;
                    case "O":
                        transformed_text += "𝐎";
                        break;
                    case "P":
                        transformed_text += "𝐏";
                        break;
                    case "Q":
                        transformed_text += "𝐐";
                        break;
                    case "R":
                        transformed_text += "𝐑";
                        break;
                    case "S":
                        transformed_text += "𝐒";
                        break;
                    case "T":
                        transformed_text += "𝐓";
                        break;
                    case "U":
                        transformed_text += "𝐔";
                        break;
                    case "V":
                        transformed_text += "𝐕";
                        break;
                    case "W":
                        transformed_text += "𝐖";
                        break;
                    case "X":
                        transformed_text += "𝐗";
                        break;
                    case "Y":
                        transformed_text += "𝐘";
                        break;
                    case "Z":
                        transformed_text += "𝐙";
                        break;
                    default:
                        transformed_text += current_char;
                        break;
                }
            }
            this.text_view.buffer.text = transformed_text;
        }
                
        private void transform_to_italic () {
            this.original_btn.sensitive = true;
            this.text_view.editable = false;
            
            var transformed_text = "";
            
            for (int i = 0; i < this.source_text.length; i++ ) {
                string current_char = this.source_text.get_char (this.source_text.index_of_nth_char (i)).to_string ();
                switch (current_char) {
                    case "a":
                        transformed_text += "𝑎";
                        break;
                    case "b":
                        transformed_text += "𝑏";
                        break;
                    case "c":
                        transformed_text += "𝑐";
                        break;
                    case "d":
                        transformed_text += "𝑑";
                        break;
                    case "e":
                        transformed_text += "𝑒";
                        break;
                    case "f":
                        transformed_text += "𝑓";
                        break;
                    case "g":
                        transformed_text += "𝑔";
                        break;
                    case "h":
                        transformed_text += "𝒉";
                        break;
                    case "i":
                        transformed_text += "𝑖";
                        break;
                    case "j":
                        transformed_text += "𝑗";
                        break;
                    case "k":
                        transformed_text += "𝑘";
                        break;
                    case "l":
                        transformed_text += "𝑙";
                        break;
                    case "m":
                        transformed_text += "𝑚";
                        break;
                    case "n":
                        transformed_text += "𝑛";
                        break;
                    case "o":
                        transformed_text += "𝑜";
                        break;
                    case "p":
                        transformed_text += "𝑝";
                        break;
                    case "q":
                        transformed_text += "𝑞";
                        break;
                    case "r":
                        transformed_text += "𝑟";
                        break;
                    case "s":
                        transformed_text += "𝑠";
                        break;
                    case "t":
                        transformed_text += "𝑡";
                        break;
                    case "u":
                        transformed_text += "𝑢";
                        break;
                    case "v":
                        transformed_text += "𝑣";
                        break;
                    case "w":
                        transformed_text += "𝑤";
                        break;
                    case "x":
                        transformed_text += "𝑥";
                        break;
                    case "y":
                        transformed_text += "𝑦";
                        break;
                    case "z":
                        transformed_text += "𝑧";
                        break;
                    case "A":
                        transformed_text += "𝐴";
                        break;
                    case "B":
                        transformed_text += "𝐵";
                        break;
                    case "C":
                        transformed_text += "𝐶";
                        break;
                    case "D":
                        transformed_text += "𝐷";
                        break;
                    case "E":
                        transformed_text += "𝐸";
                        break;
                    case "F":
                        transformed_text += "𝐹";
                        break;
                    case "G":
                        transformed_text += "𝐺";
                        break;
                    case "H":
                        transformed_text += "𝐻";
                        break;
                    case "I":
                        transformed_text += "𝐼";
                        break;
                    case "J":
                        transformed_text += "𝐽";
                        break;
                    case "K":
                        transformed_text += "𝐾";
                        break;
                    case "L":
                        transformed_text += "𝐿";
                        break;
                    case "M":
                        transformed_text += "𝑀";
                        break;
                    case "N":
                        transformed_text += "𝑁";
                        break;
                    case "O":
                        transformed_text += "𝑂";
                        break;
                    case "P":
                        transformed_text += "𝑃";
                        break;
                    case "Q":
                        transformed_text += "𝑄";
                        break;
                    case "R":
                        transformed_text += "𝑅";
                        break;
                    case "S":
                        transformed_text += "𝑆";
                        break;
                    case "T":
                        transformed_text += "𝑇";
                        break;
                    case "U":
                        transformed_text += "𝑈";
                        break;
                    case "V":
                        transformed_text += "𝑉";
                        break;
                    case "W":
                        transformed_text += "𝑊";
                        break;
                    case "X":
                        transformed_text += "𝑋";
                        break;
                    case "Y":
                        transformed_text += "𝑌";
                        break;
                    case "Z":
                        transformed_text += "𝑍";
                        break;
                    default:
                        transformed_text += current_char;
                        break;
                }
            }
            this.text_view.buffer.text = transformed_text;
        }
    }
}
