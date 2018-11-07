#include <gst/video/videooverlay.h>
#include <gtk/gtk.h>

#ifdef GDK_WINDOWING_X11
#include <gdk/gdkx.h>  // for GDK_WINDOW_XID
#endif

#ifdef GDK_WINDOWING_WIN32
#include <gdk/gdkwin32.h>  // for GDK_WINDOW_HWND
#endif

static guintptr video_window_handle = 0;

static GstBusSyncReply bus_sync_handler (GstBus * bus, GstMessage * message, gpointer user_data)
{
 // ignore anything but 'prepare-window-handle' element messages
 if (!gst_is_video_overlay_prepare_window_handle_message (message))
   return GST_BUS_PASS;

 if (video_window_handle != 0)
 {
   GstVideoOverlay *overlay;

   // GST_MESSAGE_SRC (message) will be the video sink element
   overlay = GST_VIDEO_OVERLAY (GST_MESSAGE_SRC (message));
   gst_video_overlay_set_window_handle (overlay, video_window_handle);
 }
 else
 {
   g_warning ("Should have obtained video_window_handle by now!");
 }

 gst_message_unref (message);
 return GST_BUS_DROP;
}

static void video_widget_realize_cb (GtkWidget * widget, gpointer data)
{
#if GTK_CHECK_VERSION(2,18,0)
  // Tell Gtk+/Gdk to create a native window for this widget instead of
  // drawing onto the parent widget.
  // This is here just for pedagogical purposes, GDK_WINDOW_XID will call
  // it as well in newer Gtk versions
  if (!gdk_window_ensure_native (widget->window))
    g_error ("Couldn't create native window needed for GstVideoOverlay!");
#endif

#ifdef GDK_WINDOWING_X11
  {
    gulong xid = GDK_WINDOW_XID (gtk_widget_get_window (video_window));
    video_window_handle = xid;
  }
#endif

#ifdef GDK_WINDOWING_WIN32
  {
    HWND wnd = GDK_WINDOW_HWND (gtk_widget_get_window (video_window));
    video_window_handle = (guintptr) wnd;
  }
#endif
}
