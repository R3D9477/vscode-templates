#include <gtk/gtk.h>
#include <overlay>

/*int main(int argc, char *argv[])
{
    gtk_init(&argc, &argv);

    GtkBuilder *builder = gtk_builder_new();
    
	GError *error = NULL;
    gtk_builder_add_from_resource(builder, "/main_window.glade", &error);

    GtkWidget *window = GTK_WIDGET(gtk_builder_get_object(builder, "main_window"));
    gtk_builder_connect_signals(builder, NULL);

    g_object_unref(builder);

    gtk_widget_show(window);
    gtk_main();

    return 0;
}*/

int main(int argc, char **argv)
{
  GtkWidget *video_window;
  GtkWidget *app_window;
  ...
  app_window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
  ...
  video_window = gtk_drawing_area_new ();
  g_signal_connect (video_window, "realize",
      G_CALLBACK (video_widget_realize_cb), NULL);
  gtk_widget_set_double_buffered (video_window, FALSE);
  ...
  // usually the video_window will not be directly embedded into the
  // application window like this, but there will be many other widgets
  // and the video window will be embedded in one of them instead
  gtk_container_add (GTK_CONTAINER (ap_window), video_window);
  ...
  // show the GUI
  gtk_widget_show_all (app_window);

  // realize window now so that the video window gets created and we can
  // obtain its XID/HWND before the pipeline is started up and the videosink
  // asks for the XID/HWND of the window to render onto
  gtk_widget_realize (video_window);

  // we should have the XID/HWND now
  g_assert (video_window_handle != 0);
  ...
  // set up sync handler for setting the xid once the pipeline is started
  bus = gst_pipeline_get_bus (GST_PIPELINE (pipeline));
  gst_bus_set_sync_handler (bus, (GstBusSyncHandler) bus_sync_handler, NULL,
      NULL);
  gst_object_unref (bus);
  ...
  gst_element_set_state (pipeline, GST_STATE_PLAYING);
  ...
}

void on_window_main_destroy() // called when window is closed
{
    gtk_main_quit();
}
