const SUPABASE_URL = 'https://xmigdfmplihptjyzsnyq.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhtaWdkZm1wbGlocHRqeXpzbnlxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODI0Nzc0NzAsImV4cCI6MjA5ODA1MzQ3MH0.tSwz0FkjsQg6-SSJvMPOuP8nGPQf656YOXk2sfW17P8';
const db = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

function getParam(key) {
  return new URLSearchParams(window.location.search).get(key);
}

function todayDate() {
  return new Date().toISOString().split('T')[0];
}

function formatDate(dateStr) {
  const d = new Date(dateStr + 'T00:00:00');
  return d.toLocaleDateString('en-US', { weekday: 'long', month: 'long', day: 'numeric', year: 'numeric' });
}

function formatTime(isoStr) {
  if (!isoStr) return '';
  return new Date(isoStr).toLocaleTimeString('en-US', { hour: 'numeric', minute: '2-digit' });
}
