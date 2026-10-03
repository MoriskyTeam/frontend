import 'package:dynamic_rcb_alerts/features/map/map_page.dart';
import 'package:dynamic_rcb_alerts/features/report/report_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'map',
      builder: (context, state) => MapPage(
        focusIncidentId: state.uri.queryParameters['incident'],
      ),
    ),
    GoRoute(
      path: '/report',
      name: 'report',
      pageBuilder: (context, state) => const MaterialPage(
        fullscreenDialog: true,
        child: ReportPage(),
      ),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(child: Text('Route not found: ${state.uri}')),
  ),
);
