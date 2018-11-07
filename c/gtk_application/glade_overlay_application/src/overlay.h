#ifndef OVERLAY
#define OVERLAY

GstBusSyncReply bus_sync_handler (GstBus * bus, GstMessage * message, gpointer user_data);
void video_widget_realize_cb (GtkWidget * widget, gpointer data);

#endif
