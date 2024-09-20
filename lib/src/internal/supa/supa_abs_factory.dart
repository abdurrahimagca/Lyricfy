import 'package:supabase_flutter/supabase_flutter.dart'as s;

abstract class SupaFactory {
   s.SupabaseClient getClient();
}