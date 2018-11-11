#include <gtk/gtk.h>

int main(int argc, char *argv[])
{
    gtk_init(&argc, &argv);
    
    GtkBuilder *builder = gtk_builder_new();
    
    GError *error = NULL;
    gtk_builder_add_from_resource(builder, "/main_window.glade", &error);
    /*g_error_free(error);*/
    
    GtkWidget *window = GTK_WIDGET(gtk_builder_get_object(builder, "main_window"));
    gtk_builder_connect_signals(builder, NULL);
    
    g_object_unref(builder);
    
    gtk_widget_show_all(window);
    
    gtk_main();
    return 0;
}

void on_window_main_destroy()
{
    gtk_main_quit();
}
